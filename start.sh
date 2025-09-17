# First run Beszel Hub
if ! docker ps --format '{{.Names}}' | grep -q '^beszel$'; then
  docker compose -f ./beszel/docker-compose.yml up -d
  echo "Beszel is up and running."
else
  echo "Beszel is already running."
fi

# Run the nginx server
docker compose up --force-recreate --build -d

echo "Web server is up and running."

# TODO: Add coolify