namespace InventoryIntelligence.DTOs;

public class VendorInventoryLotReturn
{

    //public int? product_id { get; set; }

    public string product_name { get; set; }

    public int quantity_on_hand { get; set; }

    public string unit_of_measurement { get; set; }

    public DateTime last_restocked_date { get; set; }
}