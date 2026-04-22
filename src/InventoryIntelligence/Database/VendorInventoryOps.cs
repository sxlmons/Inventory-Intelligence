using InventoryIntelligence.DTOs;
using Npgsql;
namespace InventoryIntelligence.Database;

public class VendorInventoryOps
{
    private readonly string _connectionString;
    private readonly ProductOps _productOps;
    private readonly VendorOps _vendorOps;

    public VendorInventoryOps(IConfiguration config, ProductOps productOps, VendorOps vendorOps)
    {
        _connectionString = config.GetConnectionString("DefaultConnection");
        _productOps = productOps;
        _vendorOps = vendorOps;
        
    }

    public async Task<List<VendorInventoryLotReturn>> GetVendorsProducts(string vendorName)
    {
        var result = new List<VendorInventoryLotReturn>();

        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();
        
        var vendorID = await _vendorOps.GetVendorIDByName(vendorName);
        if (vendorID == null)
        {
            return result; // empty list
        }

        var query = new NpgsqlCommand("""
            SELECT 
                vil.product_id,
                p.product_name,
                vil.quantity_on_hand,
                vil.unit_of_measurement,
                vil.last_restocked_date
            FROM vendorinventorylot vil
            LEFT JOIN product p ON vil.product_id = p.product_id
            WHERE vil.vendor_id = @id;
            """, conn);

        query.Parameters.AddWithValue("id", vendorID.Value);

        await using var reader = await query.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            result.Add(new VendorInventoryLotReturn
            {
                product_name = reader.GetString(1),
                quantity_on_hand = reader.GetInt32(2),
                unit_of_measurement = reader.GetString(3),
                last_restocked_date = reader.GetDateTime(4)
            });
        }

        return result;
    }

    public async Task<bool> CheckVendorSellsProduct(int productID, int vendorID)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();
        
        var query = new NpgsqlCommand("""
            SELECT EXISTS(
                SELECT 1
                FROM vendorinventorylot 
                WHERE vendor_id = @vendorID AND product_id = @productID
            );
            """, conn);

        query.Parameters.AddWithValue("productID", productID);
        query.Parameters.AddWithValue("vendorID", vendorID);

        var result = (bool)await query.ExecuteScalarAsync();
        return result;
    }

    public async Task<bool> IncreaseQuantityOfVendorProductByAmount(int productID, int vendorID, int quantityToIncreaseBy)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();
        
        var query = new NpgsqlCommand("""
            UPDATE vendorinventorylot
            SET quantity_on_hand = quantity_on_hand + @quantity,
                last_restocked_date = clock_timestamp()
            WHERE vendor_id = @vendorID AND product_id = @productID;
            """, conn);

        query.Parameters.AddWithValue("quantity", quantityToIncreaseBy);
        query.Parameters.AddWithValue("productID", productID);
        query.Parameters.AddWithValue("vendorID", vendorID);

        var rowsAffected = await query.ExecuteNonQueryAsync();
        return rowsAffected > 0;
    }


    public async Task<bool> DecreaseQuantityOfVendorProductByAmount(string productName, string vendorName, int quantityToDecreaseBy)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();
        var vendorID = await _vendorOps.GetVendorIDByName(vendorName);
        if (vendorID == null)
        {
            return false;
        }
        var productID = await _productOps.GetProductIDByName(productName);
        if (productID != null){

            var query = new NpgsqlCommand("""
                UPDATE vendorinventorylot
                SET quantity_on_hand = quantity_on_hand - @quantity
                WHERE vendor_id = @vendorID AND product_id = @productID;
                """, conn);

            query.Parameters.AddWithValue("quantity", quantityToDecreaseBy);
            query.Parameters.AddWithValue("productID", productID);
            query.Parameters.AddWithValue("vendorID", vendorID);

            var rowsAffected = await query.ExecuteNonQueryAsync();
            return rowsAffected > 0;
        }
        return false;
    }

    public async Task<bool> AddProductToVendorsLot(string vendorName, string productName, string categoryName, int quantity, string unitOfMeasure, double pricePerUnit)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();
        
        var vendorID = await _vendorOps.GetVendorIDByName(vendorName);
        if (vendorID == null)
        {
            return false;
        }

        var productID = await _productOps.GetProductIDByName(productName);
        if (productID != null)
        {
            var alreadyAdded = await CheckVendorSellsProduct(productID.Value, vendorID.Value);

            if (alreadyAdded)
            {
                // Increase the quantity of the item
                var increased = await IncreaseQuantityOfVendorProductByAmount(productID.Value, vendorID.Value, quantity);
                var inv1 = await UpdateInventory(productID.Value, quantity, pricePerUnit);

                return increased && inv1;
            }

           
            var insertExisting = new NpgsqlCommand("""
                INSERT INTO vendorinventorylot(vendor_id, product_id, quantity_on_hand, unit_of_measurement)
                VALUES(
                @vendorID, 
                @productID, 
                @quantity, 
                @unit
                );
                """, conn);

            insertExisting.Parameters.AddWithValue("productID", productID.Value);
            insertExisting.Parameters.AddWithValue("vendorID", vendorID.Value);
            insertExisting.Parameters.AddWithValue("quantity", quantity);
            insertExisting.Parameters.AddWithValue("unit", unitOfMeasure);

            var rows = await insertExisting.ExecuteNonQueryAsync();
            var inv2 = await UpdateInventory(productID.Value, quantity, pricePerUnit);

            return rows > 0 && inv2;
        }
        
        
        // Add product to the DB (since it doesnt exist)
        
        var addedProductID = await _productOps.AddProductRecord(productName, categoryName, unitOfMeasure, pricePerUnit);
        if (addedProductID != null)
        {
            var insertNew = new NpgsqlCommand("""
                INSERT INTO vendorinventorylot(vendor_id, product_id, quantity_on_hand, unit_of_measurement)
                VALUES(
                @vendorID, 
                @productID, 
                @quantity, 
                @unit
                );
                """, conn);

            insertNew.Parameters.AddWithValue("productID", addedProductID.Value);
            insertNew.Parameters.AddWithValue("vendorID", vendorID.Value);
            insertNew.Parameters.AddWithValue("quantity", quantity);
            insertNew.Parameters.AddWithValue("unit", unitOfMeasure);

            var rows = await insertNew.ExecuteNonQueryAsync();

            var inv = await UpdateInventory(addedProductID.Value, quantity, pricePerUnit);
            return rows > 0 && inv;
        }
        
        Console.WriteLine("Error adding product?");
        return false;
        
    }

    public async Task<bool> UpdateInventory(int productID, int quantity, double pricePerUnit)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();

        var query = new NpgsqlCommand("""
            INSERT INTO inventory (product_id, total_stored_quantity, price_per_unit, last_stock_date)
            VALUES (
            @productID, 
            @quantity, 
            @price, 
            clock_timestamp())
            ON CONFLICT (product_id)
            DO UPDATE SET
                total_stored_quantity = inventory.total_stored_quantity + EXCLUDED.total_stored_quantity,
                last_stock_date = clock_timestamp();
            """, conn);

        query.Parameters.AddWithValue("productID", productID);
        query.Parameters.AddWithValue("quantity", quantity);
        query.Parameters.AddWithValue("price", pricePerUnit);

        var rows = await query.ExecuteNonQueryAsync();
        return rows > 0;
    }

    public async Task<bool> UpdateInventoryDecrease(int productID, int quantity)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();

       var cmd = new NpgsqlCommand("""
            UPDATE inventory
            SET total_stored_quantity = total_stored_quantity - @quantity
            WHERE product_id = @productID
            AND total_stored_quantity >= @quantity;
        """, conn);

        cmd.Parameters.AddWithValue("@quantity", quantity);
        cmd.Parameters.AddWithValue("@productID", productID);

        var rows = await cmd.ExecuteNonQueryAsync();

        return rows > 0;
    }
}