namespace InventoryIntelligence.DTOs;

public class Product
{
    public string name { get; set; }
    public double price { get; set; }
    public int quantity { get; set; }
    public Category category { get; set; }
}