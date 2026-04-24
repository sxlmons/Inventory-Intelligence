using InventoryIntelligence.DTOs;
using Npgsql;
namespace InventoryIntelligence.Database;

public class InventoryOps
{
    private readonly string _connectionString;
    // private readonly ProductOps _productOps;

    public InventoryOps(IConfiguration config)
    {
        _connectionString = config.GetConnectionString("DefaultConnection");
        // private readonly ProductOps _productOps;
    }

    public async Task<List<Inventory>> GetFullInventory()
    {
        var result = new List<Inventory>();

        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();

        var query = new NpgsqlCommand("""
            SELECT
                c.category_id,
                c.category_name,
                c.level_of_category,

                pc.category_name AS parent_category_name,

                p.product_name,
                i.total_stored_quantity,
                i.price_per_unit,
                i.last_stock_date

            FROM inventory i
            INNER JOIN product p
                ON i.product_id = p.product_id

            INNER JOIN category c
                ON p.category_id = c.category_id

            LEFT JOIN category pc
                ON c.parent_category_id = pc.category_id;
            """, conn);

        await using var reader = await query.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            var category = new Category
            {
                category_id = reader.GetInt32(0),
                category_name = reader.GetString(1),
                level_of_category = reader.GetInt32(2),
                parent_category_name = reader.IsDBNull(3)
                    ? null
                    : reader.GetString(3)
            };

            result.Add(new Inventory
            {
                category = category,
                product_name = reader.GetString(4),
                total_stored_quantity = reader.GetInt32(5),
                price_per_unit = reader.GetDouble(6),
                last_stock_date = reader.GetDateTime(7)
            });
        }

        return result;
    }
}