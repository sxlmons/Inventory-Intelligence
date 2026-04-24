namespace InventoryIntelligence.DTOs;

public class Vendor
{
    public int vendor_id { get; set; }

    public string name { get; set; }

    public string dominant_product { get; set; }

    public string contact_email { get; set; }

    public DateTime created_at { get; set; }
}