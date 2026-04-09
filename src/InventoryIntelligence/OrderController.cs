using Microsoft.AspNetCore.Mvc;
using System.Text.Json.Serialization;
using InventoryIntelligence.DTOs;

namespace InventoryIntelligence;

[ApiController]
[Route("api/inventory_intelligence/[controller]/[action]")]
public class inventoryController : ControllerBase
{
    [HttpGet]
    public IActionResult all_items()
    {
        var products = new List<Product>();
        
        // EXAMPLE 
        products.Add(new Product
            {
                name = "Apple",
                quantity = 10,
                price = 10.0,
                category = new Category
                {
                    name = "Produce",
                }
            }
        );
        
        return Ok(products);
    }

    // Not included but could imagine it being good for order team
    [HttpGet]
    public IActionResult get_items_by_category(int category_id)
    {
        var products = new List<Product>();
        
        products.Add(new Product
            {
                name = "Apple",
                quantity = 10,
                price = 10.0,
                category = new Category
                {
                    name = "Produce",
                }
            }
        );
        
        // SELECT product WHERE category is the id
        
        return Ok(products);
    }

    [HttpPost]
    public IActionResult sold_items(List<Product> products)
    {
        // remove products my id
        // or however you do it 
        
        return Ok();
    }

    [HttpGet]
    public IActionResult get_item_categories()
    {
        var categories = new List<Category>();
        
        // EXAMPLE DATA
        categories.Add(new Category
        {
            name = "Produce",
        });
        // DELETE 
        
        // categories = funcitonForGettingCategories(); EXAMPLE 
        
        return Ok(categories);
    }
}