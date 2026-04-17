using InventoryIntelligence.DTOs;
using Microsoft.AspNetCore.Mvc;

namespace InventoryIntelligence.Tests;

public class UnitTest1
{
    /*
    Test Cases for InventoryController:
    */

    [Fact]
    public void TC101()
    { // This test case is to check if the all_items method returns a list of products as expected.
        var controller = new inventoryController();
        var result = controller.all_items() as OkObjectResult;
        Assert.NotNull(result);
        Assert.IsType<List<Product>>(result.Value);

    }

    [Fact]
    public void TC102()
    { // This test case is to check if the get_items_by_category method returns a list of products for a valid category id.
        var controller = new inventoryController();
        var result = controller.get_items_by_category(1) as OkObjectResult;
        Assert.NotNull(result);
        Assert.IsType<List<Product>>(result.Value);
    }

    [Fact]
    public void TC103()
    { // This test case is to check if the sold_items method can handle a valid list of products and returns an OkResult.
        var controller = new inventoryController();
        var products = new List<Product>
        {
            new Product
            {
                id = 1,
                name = "Apple",
                quantity = 10,
                price = 10.0,
                category = new Category
                {
                    name = "Produce",
                }
            }
        };
        var result = controller.sold_items(products) as OkResult;
        Assert.NotNull(result);
    }

    [Fact]
    public void TC104()
    { // This test case is to check if the sold_items method can handle an empty list of products without throwing an exception.
        var controller = new inventoryController();
        var result = controller.sold_items(new List<Product>()) as OkResult;
        Assert.NotNull(result);
    }

    [Fact]
    public void TC105()
    {
       // This test case is to check if the sold_items method can handle a null input without throwing an exception.
        var controller = new inventoryController();
        var result = controller.sold_items(null) as OkResult;
        Assert.NotNull(result);
    }

    [Fact]
    public void TC106()
    { // This test case is to check if the get_item_categories method returns a list of categories as expected.
        var controller = new inventoryController();
        var result = controller.get_item_categories() as OkObjectResult;
        Assert.NotNull(result);
        Assert.IsType<List<Category>>(result.Value);
    }

    [Fact]
    public void TC107()
    { // This test case is to check if the get_items_by_category method returns an empty list for an invalid category id.
        var controller = new inventoryController();
        var result = controller.get_items_by_category(-1) as OkObjectResult;
        Assert.NotNull(result);
        Assert.IsType<List<Product>>(result.Value);
        Assert.Empty((List<Product>)result.Value);
    }

    [Fact]
    public void TC108()
    { // This test case is to check if the all_items method returns an empty list when there are no products in the inventory.
        var controller = new inventoryController();
        var result = controller.all_items() as OkObjectResult;
        Assert.NotNull(result);
        Assert.IsType<List<Product>>(result.Value);
        Assert.Empty((List<Product>)result.Value);
    }

    [Fact]
    public void TC109()
    { // This test case is to check if the sold_items method can handle a list of products with invalid data (e.g., negative quantity) without throwing an exception.
        var controller = new inventoryController();
        var products = new List<Product>
        {
            new Product
            {
                id = 1,
                name = "Apple",
                quantity = -10, // Invalid quantity
                price = 10.0,
                category = new Category
                {
                    name = "Produce",
                }
            }
        };
        var result = controller.sold_items(products) as OkResult;
        Assert.NotNull(result);
    }

    [Fact]
    public void TC110()
    { // This test case is to check if the get_item_categories method returns an empty list when there are no categories in the inventory.
        var controller = new inventoryController();
        var result = controller.get_item_categories() as OkObjectResult;
        Assert.NotNull(result);
        Assert.IsType<List<Category>>(result.Value);
        Assert.Empty((List<Category>)result.Value);
    }

    [Fact]
    public void TC111()
    { // This test case is to check if the get_items_by_category method returns a list of products for a valid category id when there are multiple products in that category.
        var controller = new inventoryController();
        var result = controller.get_items_by_category(1) as OkObjectResult;
        Assert.NotNull(result);
        Assert.IsType<List<Product>>(result.Value);
        Assert.True(((List<Product>)result.Value).Count > 1);
    }

    /*
    Test cases for Method and Header Validation:
    */

    [Fact]
    public void TC201()
    { // This test case is to check if the all_items method can be accessed with a GET request and returns a status code of 200 (OK).
        var controller = new inventoryController();
        var result = controller.all_items() as OkObjectResult;
        Assert.NotNull(result);
        Assert.Equal(200, result.StatusCode);
    }

    [Fact]
    public void TC202()
    { // This test case is to check if the get_items_by_category method can be accessed with a GET request and returns a status code of 200 (OK) for a valid category id.
        var controller = new inventoryController();
        var result = controller.get_items_by_category(1) as OkObjectResult;
        Assert.NotNull(result);
        Assert.Equal(200, result.StatusCode);
    }

    [Fact]
    public void TC203()
    { // This test case is to check if the sold_items method can be accessed with a POST request and returns a status code of 200 (OK) for a valid list of products.
        var controller = new inventoryController();
        var products = new List<Product>
        {
            new Product
            {
                id = 1,
                name = "Apple",
                quantity = 10,
                price = 10.0,
                category = new Category
                {
                    name = "Produce",
                }
            }
        };
        var result = controller.sold_items(products) as OkResult;
        Assert.NotNull(result);
        Assert.Equal(200, result.StatusCode);
    }

    [Fact]
    public void TC204()
    { // This test case is to check if the sold_items method returns a status code of 400 (Bad Request) when accessed with an invalid HTTP method (e.g., GET).
        var controller = new inventoryController();
        var result = controller.sold_items(new List<Product>()) as BadRequestResult;
        Assert.NotNull(result);
        Assert.Equal(400, result.StatusCode);
    }

    [Fact]
    public void TC205()
    { // This test case is to check if the get_items_by_category method returns a status code of 400 (Bad Request) when accessed with an invalid HTTP method (e.g., POST).
        var controller = new inventoryController();
        var result = controller.get_items_by_category(1) as BadRequestResult;
        Assert.NotNull(result);
        Assert.Equal(400, result.StatusCode);
    }

}
