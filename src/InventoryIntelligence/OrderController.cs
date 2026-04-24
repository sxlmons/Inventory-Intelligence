using Microsoft.AspNetCore.Mvc;
using System.Text.Json.Serialization;
using InventoryIntelligence.DTOs;
using InventoryIntelligence.Database;

namespace InventoryIntelligence;

[ApiController]
[Route("api/inventory_intelligence/[controller]/[action]")]
public class vender_inventoryController : ControllerBase
{

    private readonly VendorInventoryOps _vendorInvOps;
    private readonly VendorOps _venOps;

    public vender_inventoryController(VendorInventoryOps venInvOps, VendorOps venOps)
    {
        _vendorInvOps = venInvOps;
        _venOps = venOps;
    }

    [HttpGet]
    //public IActionResult vendor_records(int vendor_id)
    public async Task<IActionResult> vendor_records(string vendor_name)
    {
        var products = await _vendorInvOps.GetVendorsProducts(vendor_name);

        return Ok(products);
    }

    [HttpPost]
    public async Task<IActionResult> register_vendor(Vendor vendor)
    {
        await _venOps.AddVendor(vendor.name, vendor.dominant_product, vendor.contact_email);

        return Ok($"Vendor {vendor.name} registered");
    }

    [HttpPost]
    public async Task<IActionResult> add_item(string vendor_name, List<Product> products)
    {
        // add the products to the vendor
        foreach (var product in products)
        {
            await _vendorInvOps.AddProductToVendorsLot(vendor_name,
                                                    product.product_name,
                                                    product.category_name ?? "",
                                                    1, product.unit_of_measure,
                                                    product.price_per_unit);
        }

        return Ok();
    }

    [HttpDelete]
    public async Task<IActionResult> remove_item(string vendor_name, List<Product> products)
    {
        foreach (var product in products)
            await _vendorInvOps.DecreaseQuantityOfVendorProductByAmount(product.product_name, vendor_name, 1);

        return Ok();
    }
}

