using Microsoft.AspNetCore.Mvc;
using System.Text.Json.Serialization;

namespace InventoryIntelligence;

[ApiController]
[Route("api/inventory_intelligence/[controller]/[action]")]
public class vender_inventoryController : ControllerBase
{
    [HttpGet]
    public IActionResult vendor_records()
    {
        return Ok("Test GET for vendor records");
    }

    [HttpPost]
    public IActionResult register_vendor()
    {
        return Ok("Test POST for vendor register");
    }

    [HttpPost]
    public IActionResult add_item()
    {
        return Ok("Test POST for add item");
    }

    [HttpPatch]
    public IActionResult update_item()
    {
        return Ok("Test PATCH for update item");
    }

    [HttpDelete]
    public IActionResult remove_item()
    {
        return Ok("Test DELETE for delete item");
    }
}