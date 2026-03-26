using Microsoft.AspNetCore.Mvc;
using System.Text.Json.Serialization;

namespace InventoryIntelligence;

[ApiController]
[Route("api/inventory_intelligence/[controller]/[action]")]
public class inventoryController : ControllerBase
{
    [HttpGet]
    public IActionResult all_items()
    {
        return Ok("Get everything in database");
        // this is a comment part of a direct push to main to test the webhook
    }

    // Not included but could imagine it being good for order team
    [HttpGet]
    public IActionResult get_items_by_type()
    {
        return Ok("Get everything in database ");
    }

    [HttpPost]
    public IActionResult sold_items()
    {
        return Ok("Receive confirmed sold items");
    }
}
