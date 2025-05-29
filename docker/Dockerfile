# Use official .NET SDK image for building the app
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

# ARG dotnet_build_log_level=q
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

WORKDIR /app

# Copy project files and restore dependencies
COPY FormulaOne.Api/*.csproj FormulaOne.Api/

# Restore dependencies
WORKDIR /app/FormulaOne.Api
RUN dotnet restore FormulaOne.Api.csproj

# Copy the rest of the source files
COPY . .

# Build the application
RUN dotnet publish FormulaOne.Api/FormulaOne.Api.csproj -c Release -o /out

# Use a runtime image for final execution
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /out .
EXPOSE 8080
ENTRYPOINT ["dotnet", "FormulaOne.Api.dll"]
