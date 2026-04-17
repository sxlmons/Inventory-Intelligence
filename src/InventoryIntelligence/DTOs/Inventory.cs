namespace InventoryIntelligence.DTOs;

public class Inventory
{
    public Category category { get; set; }

    public string product_name { get; set; }

    public int total_stored_quantity { get; set; }

    public double price_per_unit { get; set; }

    public DateTime last_stock_date { get; set; }

    public string? parent_category_name { get; set; }
}