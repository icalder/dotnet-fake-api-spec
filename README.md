# fake-api

## Setup
```powershell
npx -p @typespec/compiler tsp init
tsp compile .
```

[Microsoft guide](https://learn.microsoft.com/en-us/azure/developer/typespec/quickstart-scaffold-dotnet)

See also:
[text](https://typespec.io/docs/getting-started/code-generation-csharp/#2-creating-a-typespec-project)

## Running
```powershell
dotnet watch --project tsp-output/server/aspnet
dotnet run --project tsp-output/server/aspnet
dotnet run --project tsp-output/server/aspnet --launch-profile http
```