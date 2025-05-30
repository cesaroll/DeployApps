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

app.MapGet("/api/best-pilots", (ILogger logger) =>
{
    logger.LogInformation("Fetching the best pilots in Formula 1");
    logger.LogDebug("Best pilots: {Pilots}", string.Join(", ", bestPilots));
    logger.LogWarning("This is a warning message for demonstration purposes");
    logger.LogError("This is an error message for demonstration purposes");
    logger.LogCritical("This is a critical message for demonstration purposes");
    logger.LogTrace("This is a trace message for demonstration purposes");
    logger.LogInformation("Returning the best pilots");
    // Simulate some processing delay
    System.Threading.Thread.Sleep(1000);
    logger.LogInformation("Best pilots fetched successfully");
    // Return the best pilots
    logger.LogInformation("Returning the best pilots: {Pilots}", string.Join(", ", bestPilots));
    // Return the best pilots as a JSON response
    var bestPilotsResponse = new
    {
        Pilots = bestPilots,
        Count = bestPilots.Length
    };
    logger.LogInformation("Best pilots response created successfully");
    logger.LogInformation("Returning response to the client");
    // Return the response
    return Results.Ok(bestPilotsResponse);
})
.WithName("GetBestPilots");

app.Run();
