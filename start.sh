# First run Beszel Hub
echo "Starting Beszel Hub..."
docker compose -f ./beszel-hub/docker-compose.yml up -d

# Run the nginx server
docker compose -f ./docker-compose.yml up --force-recreate --build -d

echo "Web server is up and running."

# TODO: Add coolify