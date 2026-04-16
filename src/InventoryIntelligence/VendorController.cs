using Microsoft.AspNetCore.Mvc;
using System.Text.Json.Serialization;
using InventoryIntelligence.DTOs;

namespace InventoryIntelligence;

[ApiController]
[Route("api/inventory_intelligence/[controller]/[action]")]
public class vender_inventoryController : ControllerBase
{
    [HttpGet]
    public IActionResult vendor_records(int vendor_id)
    {
        var products = new List<Product>();
        
        // Get all records by vendor name
        
        // EXAMPLE 
        products.Add(new Product
            {
                product_name = "Apple",
                unit_of_measure = "kg",
                price_per_unit = 10.0,
                category = new Category
                {
                    category_name = "Produce",
                }
            }
        );
        
        return Ok(products);
    }

    [HttpPost]
    public IActionResult register_vendor(Vendor vendor)
    {
        // add vendor to database 
        
        return Ok($"Vendor {vendor.name} registered");
    }

    [HttpPost]
    public IActionResult add_item(int vendor_id, List<Product> products)
    {
        // add the products to the vendor
        
        return Ok();
    }

    [HttpPatch]
    public IActionResult update_item(int vendor_id, List<Product> products)
    {
        // update
        
        return Ok();
    }

    [HttpDelete]
    public IActionResult remove_item(int vendor_id, List<Product> products)
    {
        // remove 
        
        return Ok();
    }
}

