# First run Beszel Hub
sudo docker compose -f ./beszel/docker-compose.yml up -d
echo "Beszel is up and running."


# Run the nginx server
docker compose up --force-recreate --build -d

echo "Web server is up and running."

# TODO: Add coolify