namespace InventoryIntelligence.DTOs;

public class Category
{
    public int category_id { get; set; }

    public int? parent_category_id { get; set; }

    public string category_name { get; set; } = string.Empty;

    public int level_of_category { get; set; }

    public DateTime created_at { get; set; }

    // from your JOIN (not stored in table)
    public string? parent_category_name { get; set; }
}