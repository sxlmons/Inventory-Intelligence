using InventoryIntelligence.DTOs;
using Npgsql;
namespace InventoryIntelligence.Database;

public class VendorOps
{
    private readonly string _connectionString;
   // private readonly ProductOps _productOps;

    public VendorOps(IConfiguration config)
    {
        _connectionString = config.GetConnectionString("DefaultConnection");
       // private readonly ProductOps _productOps;
    }

    public async Task<int?> GetVendorIDByName(string vendorName)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();

        var query = new NpgsqlCommand("""
            SELECT vendor_id
            FROM vendor
            WHERE name = @name
            LIMIT 1;
            """, conn);

        query.Parameters.AddWithValue("name", vendorName);

        var result = await query.ExecuteScalarAsync();

        if (result == null || result == DBNull.Value)
        {
            return null;
        }

        return (int)result;
    }

    public async Task<bool> UpdateVendorName(string vendorName, int vendorID)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();

        var query = new NpgsqlCommand("""
            UPDATE vendor
            SET name = @name
            WHERE vendor_id = @vendor;
            """, conn);

        query.Parameters.AddWithValue("vendor", vendorID);
        query.Parameters.AddWithValue("name", vendorName);

        var result = (bool)await query.ExecuteScalarAsync();
        return result;
    }

    public async Task<bool> UpdateDominantProduct(string dominantProduct, int vendorID)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();

        var query = new NpgsqlCommand("""
            UPDATE vendor
            SET dominant_product = @product
            WHERE vendor_id = @vendor;
            """, conn);

        query.Parameters.AddWithValue("vendor", vendorID);
        query.Parameters.AddWithValue("product", dominantProduct);

        var result = (bool)await query.ExecuteScalarAsync();
        return result;
    }

    public async Task<bool> UpdateContactEmail(string contactEmail, int vendorID)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();

        var query = new NpgsqlCommand("""
            UPDATE vendor
            SET contact_email = @email
            WHERE vendor_id = @vendor;
            """, conn);

        query.Parameters.AddWithValue("vendor", vendorID);
        query.Parameters.AddWithValue("email", contactEmail);

        var result = (bool)await query.ExecuteScalarAsync();
        return result;
    }

    public async Task<bool> AddVendor(string vendorName, string dominantProduct, string contactEmail)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();

        var query = new NpgsqlCommand("""
            INSERT INTO vendor(name, dominant_product, contact_email)
            VALUES(
            @name,
            @mainproduct,
            @email
            );
            """, conn);

        query.Parameters.AddWithValue("name", vendorName);
        query.Parameters.AddWithValue("mainproduct", dominantProduct);
        query.Parameters.AddWithValue("email", contactEmail);

        var rows = await query.ExecuteNonQueryAsync();

        return rows > 0;
    }
    // public async Task<int?> GetCategoryIDByName(string categoryName)
    // {
    //     await using var conn = new NpgsqlConnection(_connectionString);
    //     await conn.OpenAsync();

    //     var query = new NpgsqlCommand("""
    //         SELECT category_id
    //         FROM category
    //         WHERE category_name = @name
    //         LIMIT 1;
    //         """, conn);

    //     query.Parameters.AddWithValue("name", categoryName);

    //     var result = await query.ExecuteScalarAsync();

    //     if (result == null || result == DBNull.Value)
    //     {
    //         return null;
    //     }

    //     return (int)result;
    // }
}