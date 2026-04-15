// using Npgsql;

// public class ProductOps
// {
//     private readonly string _connectionString;

//     public ProductOps(IConfiguration config)
//     {
//         _connectionString = config.GetConnectionString("DefaultConnection");
//     }

//     public async Task<List<Product>> GetProductsForVendor()
//     {
//         var result = new List<Product>();

//         await using var conn = new NpgsqlConnection(_connectionString);
//         await conn.OpenAsync();

//         var query = new NpgsqlCommand("SELECT id, name, quantity, price FROM product", conn);

//         await using var reader = await query.ExecuteReaderAsync();

//         while (await reader.ReadAsync())
//         {
//             result.Add(new Product
//             {
//                 id = reader.GetInt32(0),
//                 name = reader.GetString(1),
//                 quantity = reader.GetInt32(2),
//                 price = reader.GetDouble(3)
//             });
//         }

//         return result;
//     }

//     public async Task Insert(Product product)
//     {
//         await using var conn = new NpgsqlConnection(_connectionString);
//         await conn.OpenAsync();

//         var cmd = new NpgsqlCommand(
//             "INSERT INTO product (name, quantity, price) VALUES (@n, @q, @p)",
//             conn
//         );

//         cmd.Parameters.AddWithValue("n", product.name);
//         cmd.Parameters.AddWithValue("q", product.quantity);
//         cmd.Parameters.AddWithValue("p", product.price);

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