
using InventoryIntelligence.DTOs;
using Npgsql;
namespace InventoryIntelligence.Database;

public class CategoryOps
{
    private readonly string _connectionString;

    public CategoryOps(IConfiguration config)
    {
        _connectionString = config.GetConnectionString("DefaultConnection");
    }

    public async Task<List<Category>> GetCategories()
    {
        var result = new List<Category>();

        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();

        var query = new NpgsqlCommand("""
            SELECT 
                c.category_id,
                c.parent_category_id,
                c.category_name,
                c.level_of_category,
                c.created_at,
                p.category_name AS parent_category_name
            FROM category c
            LEFT JOIN category p 
                ON c.parent_category_id = p.category_id;
            """, conn);

        await using var reader = await query.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            result.Add(new Category
            {
                category_id = reader.GetInt32(0),
                parent_category_id = reader.IsDBNull(1) ? null : reader.GetInt32(1),
                category_name = reader.GetString(2),
                level_of_category = reader.GetInt32(3),
                created_at = reader.GetDateTime(4),
                // parent can be NULL (root categories)
                parent_category_name = reader.IsDBNull(5)
                    ? null
                    : reader.GetString(5)
            });
        }
        return result;
    }

    public async Task<int?> GetCategoryIDByName(string categoryName)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();

        var query = new NpgsqlCommand("""
            SELECT category_id
            FROM category
            WHERE category_name = @name
            LIMIT 1;
            """, conn);

        query.Parameters.AddWithValue("name", categoryName);

        var result = await query.ExecuteScalarAsync();

        if (result == null || result == DBNull.Value)
        {
            return null;
        }

        return (int)result;
    }
}
//     public async Task Insert(Product product)
//     {
//         await using var conn = new NpgsqlConnection(_connectionString);
//         await conn.OpenAsync();

//         var cmd = new NpgsqlCommand(
//             "INSERT INTO product (name, quantity, price) VALUES (@n, @q, @p)",
//             conn
//         );

//         cmd.Parameters.AddWithValue("n", NpgsqlTypes.NpgsqlDbType.Text, product.name);
//         cmd.Parameters.AddWithValue("q", NpgsqlTypes.NpgsqlDbType.Integer, product.quantity);
//         cmd.Parameters.AddWithValue("p", NpgsqlTypes.NpgsqlDbType.Double, product.price);

//         await cmd.ExecuteNonQueryAsync();
//     }

//     public async Task UpdateQuantity(int id, int delta)
//     {
//         await using var conn = new NpgsqlConnection(_connectionString);
//         await conn.OpenAsync();

//         var cmd = new NpgsqlCommand(
//             "UPDATE product SET quantity = quantity + @delta WHERE id = @id",
//             conn
//         );

//         cmd.Parameters.AddWithValue("delta", delta);
//         cmd.Parameters.AddWithValue("id", id);

//         await cmd.ExecuteNonQueryAsync();
//     }

//     public async Task Delete(int id)
//     {
//         await using var conn = new NpgsqlConnection(_connectionString);
//         await conn.OpenAsync();

//         var cmd = new NpgsqlCommand(
//             "DELETE FROM product WHERE id = @id",
//             conn
//         );

//         cmd.Parameters.AddWithValue("id", id);

//         await cmd.ExecuteNonQueryAsync();
//     }
// }