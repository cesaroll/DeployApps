var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddOpenApi();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

app.UseHttpsRedirection();

var bestPilots = new[]
{
    "Checo", "Alonso", "Senna", "LeClerc", "Sainz", "Colapinto"
};

app.MapGet("/api/best-pilots", (ILogger<Program> logger) =>
{
    logger.LogInformation("Fetching the best pilots in Formula 1");
    var pilots = bestPilots.Select(pilot => new { Name = pilot }).ToList();
    var result = new
    {
        Pilots = pilots,
        Count = pilots.Count
    };
    return Results.Ok(result);
})
.WithName("GetBestPilots");

app.Run();
