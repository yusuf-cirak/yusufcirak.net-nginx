mkdir -p ../web-server

# copy beszel compose file to web-server directory
rm -rf ../web-server/beszel
rm -rf ../web-server/nginx
rm -rf ../web-server/tirreno
rm -rf ../web-server/signoz
rm -rf ../web-server/traefik

cp ./beszel ../web-server/beszel -r
cp ./nginx ../web-server/nginx -r
cp ./tirreno ../web-server/tirreno -r
cp ./signoz ../web-server/signoz -r
cp ./traefik ../web-server/traefik -r

# change directory to web-server
cd ../web-server
echo "Starting Beszel Hub..."

# First run Beszel Hub
docker compose -f beszel/docker-compose.yml up --build --force-recreate -d

# Run the tirreno server
echo "Starting Tirreno server..."
docker compose -f tirreno/docker-compose.yml up --build --force-recreate -d


# Run the Signoz server
echo "Starting Signoz server..."
docker compose -f signoz/docker-compose.yaml up --build --force-recreate -d --remove-orphans
# Run Traefik (edge proxy). --remove-orphans removes the old nginx container
# since both compose files share the same project name (web-server).
echo "Starting Traefik..."
cd traefik
docker compose up --force-recreate -d --remove-orphans

echo "Web server is up and running."

# TODO: Add coolify