# Stage 1: Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /source 

COPY InventoryIntelligence.sln ./
COPY src/InventoryIntelligence/InventoryIntelligence.csproj src/InventoryIntelligence/
COPY tests/InventoryIntelligence.Tests/InventoryIntelligence.Tests.csproj tests/InventoryIntelligence.Tests/

RUN dotnet restore 

COPY . .
RUN dotnet publish src/InventoryIntelligence/InventoryIntelligence.csproj \
    -c Release \
    -o /app/publish

# Stage 2: Runtime 
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS runtime
WORKDIR /app

COPY --from=build /app/publish .

EXPOSE 8080
ENV ASPNETCORE_URLS=http://0.0.0.0:8080

ENTRYPOINT ["dotnet", "InventoryIntelligence.dll"]