using Microsoft.AspNetCore.Mvc;
using System.Text.Json.Serialization;
using InventoryIntelligence.DTOs;
using InventoryIntelligence.Database;

namespace InventoryIntelligence;

[ApiController]
[Route("api/inventory_intelligence/[controller]/[action]")]
public class inventoryController : ControllerBase
{
    private readonly CategoryOps _categoryOps;
    private readonly InventoryOps _inventoryOps;
    private readonly VendorInventoryOps _vendorInvOps;
    
    public inventoryController(CategoryOps CatOps, InventoryOps InvOps, VendorInventoryOps VenInvOps)
    {
        _categoryOps = CatOps;
        _inventoryOps = InvOps;
        _vendorInvOps = VenInvOps;
    }
    
    [HttpGet]
    public async Task<IActionResult> all_items()
    {
        var products = await _inventoryOps.GetFullInventory();
        
        return Ok(products);
    }
    
    /*
    [HttpGet]
    public IActionResult get_items_by_category(int category_id)
    {
        var products = new List<Product>();
        
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
        
        // SELECT product WHERE category is the id
        
        return Ok(products);
    }
    */

    [HttpPost]
    public async Task<IActionResult> sold_items(int vendor_id, List<Product> products)
    {
        foreach (var product in products)
            await _vendorInvOps.DecreaseQuantityOfVendorProductByAmount(product.product_id, vendor_id, 1);
        
        return Ok();
    }

    [HttpGet]
    public async Task<IActionResult> get_item_categories()
    {
        List<Category> categories = await _categoryOps.GetCategories();
        
        return Ok(categories);
    }
}
