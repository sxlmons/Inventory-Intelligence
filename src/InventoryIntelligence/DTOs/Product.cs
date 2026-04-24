namespace InventoryIntelligence.DTOs;

public class Product
{
    public int product_id { get; set; }

    public int category_id { get; set; }

    public string product_name { get; set; }

    public string unit_of_measure { get; set; }

    public double price_per_unit { get; set; }

    public Category category { get; set; }

    public DateTime stocked_at { get; set; }

    public DateTime updated_at { get; set; }

    public string? category_name { get; set; }
}

