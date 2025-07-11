# Use the .NET Core 3.1 SDK to build the app
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -o /app/publish

# Use the .NET Core 3.1 runtime to run the app
FROM mcr.microsoft.com/dotnet/core/runtime:3.1
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "TestProject.dll"]