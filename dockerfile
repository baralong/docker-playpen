FROM microsoft/dotnet-nightly:2.1-sdk as builder
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy and build everything else
COPY . ./
RUN dotnet publish -c Release -o out

# now for the container to run
FROM microsoft/dotnet-nightly:2.1-runtime-alpine
# much bigger
# FROM microsoft/dotnet-nightly:2.1-runtime

WORKDIR /app

COPY --from=builder /app/out .

ENTRYPOINT ["dotnet", "docker-playpen.dll"]
