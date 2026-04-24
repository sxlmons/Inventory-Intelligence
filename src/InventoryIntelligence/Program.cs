using InventoryIntelligence.Database;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<CategoryOps>();
builder.Services.AddScoped<InventoryOps>();
builder.Services.AddScoped<ProductOps>();
builder.Services.AddScoped<VendorInventoryOps>();
builder.Services.AddScoped<VendorOps>();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.MapControllers();

app.Run();