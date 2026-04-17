using InventoryIntelligence.DTOs;
using Npgsql;
using System.Globalization;
namespace InventoryIntelligence.Database;

// var builder = WebApplication.CreateBuilder(args);
// builder.Services.AddScoped<CategoryOps>();

public class ProductOps
{
    private readonly string _connectionString;
    private readonly CategoryOps _categoryOps;

    public ProductOps(IConfiguration config, CategoryOps categoryOps)
    {
        _connectionString = config.GetConnectionString("DefaultConnection");
        _categoryOps = categoryOps;
    }

    private string NormalizeName(string name)
    {
        var textInfo = CultureInfo.InvariantCulture.TextInfo;

        name = name.Trim().ToLowerInvariant();
        name = textInfo.ToTitleCase(name);

        return name;
    }

    public async Task<List<Product>> GetProducts()
    {
        var result = new List<Product>();

        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();
        
        
        var query = new NpgsqlCommand("""
            SELECT 
                p.product_id,
                p.category_id,
                p.product_name,
                p.unit_of_measure,
                p.price_per_unit,
                p.updated_at,
                c.category_name
            FROM product p
            LEFT JOIN category c 
                ON p.category_id = c.category_id;
        """, conn);

        await using var reader = await query.ExecuteReaderAsync();

        while (await reader.ReadAsync())
        {
            result.Add(new Product
            {
                product_id = reader.GetInt32(0),
                category_id = reader.GetInt32(1),
                product_name = reader.GetString(2),
                unit_of_measure = reader.GetString(3),
                price_per_unit = reader.GetDouble(4),
                updated_at = reader.GetDateTime(5),
                category_name = reader.IsDBNull(6) ? null : reader.GetString(6)
            });
        }

        return result;
    }

    public async Task<int?> GetProductIDByName(string productName)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();

        var query = new NpgsqlCommand("""
            SELECT product_id
            FROM product
            WHERE product_name = @name
            LIMIT 1;
            """, conn);

        query.Parameters.AddWithValue("name", productName);

        var result = await query.ExecuteScalarAsync();

        if (result == null || result == DBNull.Value)
        {
            return null;
        }

        return (int)result;
    }

    public async Task<int?> GetProductIdIfExists(string productName, string unitOfMeasure)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();
        
        var normalizedName = NormalizeName(productName);

        var query = new NpgsqlCommand("""
            SELECT product_id
            FROM product
            WHERE product_name = @name
            LIMIT 1;
            """, conn);

        query.Parameters.AddWithValue("name", normalizedName);

        var result = await query.ExecuteScalarAsync();

        if (result == null || result == DBNull.Value)
        {
            return null; 
        }
        
        if (result != null || result != DBNull.Value)
        {
            if (unitOfMeasure == "kg" || unitOfMeasure == "ml" || unitOfMeasure == "lbs" || unitOfMeasure == "l")
            {
                var duplicatequery = new NpgsqlCommand("""
                    SELECT unit_of_measure
                    FROM product
                    WHERE product_name = @name
                """, conn);

                duplicatequery.Parameters.AddWithValue("name", normalizedName);

                await using var reader = await duplicatequery.ExecuteReaderAsync();

                while (await reader.ReadAsync())
                {
                    var dbUnit = reader.GetString(0);

                    if (dbUnit == "bundle" || dbUnit == "punnet" || dbUnit == "bag")
                    {
                      //  Console.WriteLine("match 2");
                        return null;
                    }
                }
            }
            if (unitOfMeasure == "bundle" || unitOfMeasure == "punnet" || unitOfMeasure == "bag")
            {
                var duplicatequerys = new NpgsqlCommand("""
                    SELECT unit_of_measure
                    FROM product
                    WHERE product_name = @name
                """, conn);

                duplicatequerys.Parameters.AddWithValue("name", normalizedName);

                await using var reader1 = await duplicatequerys.ExecuteReaderAsync();

                while (await reader1.ReadAsync())
                {
                    var dbUnit = reader1.GetString(0);

                    if (dbUnit == "kg" || dbUnit == "ml" || dbUnit == "lbs"|| dbUnit == "l")
                    {
                       // Console.WriteLine("match 2");
                        return null;
                    }
                }
            }
        }
        return (int)result;
    }


    public async Task<int?> AddProductRecord(string productName, string categoryName, string unitOfMeasure, double pricePerUnit)
    {
        await using var conn = new NpgsqlConnection(_connectionString);
        await conn.OpenAsync();
        
        var categoryID = await _categoryOps.GetCategoryIDByName(categoryName);
        var normalizedName = NormalizeName(productName);

        if (categoryID == null)
        {
          return null;  // Instead of this, maybe consider sending error message/adding the category manually? idk. I feel like every product should only have a category that exists already
        }

        var existingProductId = await GetProductIdIfExists(normalizedName, unitOfMeasure);
    
        if (existingProductId != null)
        {
            return null;
        }
        
        var query = new NpgsqlCommand("""
            INSERT INTO product(product_name, category_id, unit_of_measure, price_per_unit)
            VALUES(
            @name, 
            @catID, 
            @unit, 
            @price
            )
            RETURNING product_id;
            """, conn);

        query.Parameters.AddWithValue("name", normalizedName);
        query.Parameters.AddWithValue("catID", categoryID.Value);
        query.Parameters.AddWithValue("unit", unitOfMeasure);
        query.Parameters.AddWithValue("price", pricePerUnit);

        var result = await query.ExecuteScalarAsync();
        
        if (result == null)
        {
            return null;
        }

        return (int)result;
        //return result == null ? null : (int?)Convert.ToInt32(result);
    }
    
}