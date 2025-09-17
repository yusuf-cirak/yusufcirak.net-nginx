mkdir -p ../web-server

# copy beszel compose file to web-server directory
cp ./beszel/docker-compose.yml ../web-server/beszel-docker-compose.yml
cp ./docker-compose.yml ../web-server/docker-compose.yml

# change directory to web-server
cd ../web-server
echo "Starting Beszel Hub..."

docker compose -f ./beszel-docker-compose.yml up -d

# Run the nginx server
docker compose -f ./docker-compose.yml up --force-recreate --build -d

echo "Web server is up and running."

# TODO: Add coolify