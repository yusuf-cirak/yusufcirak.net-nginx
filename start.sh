mkdir -p ../web-server

# copy beszel compose file to web-server directory
rm -rf ../web-server/beszel
rm -rf ../web-server/nginx
rm -rf ../web-server/tirreno
rm -rf ../web-server/signoz

cp ./beszel ../web-server/beszel -r
cp ./nginx ../web-server/nginx -r
cp ./tirreno ../web-server/tirreno -r
cp ./signoz ../web-server/signoz -r

# change directory to web-server
cd ../web-server
echo "Starting Beszel Hub..."

# First run Beszel Hub
docker compose -f beszel/docker-compose.yml up -d

# Run the tirreno server
echo "Starting Tirreno server..."
docker compose -f tirreno/docker-compose.yml up -d


# Run the Signoz server
echo "Starting Signoz server..."
docker compose -f signoz/docker-compose.yaml up -d --remove-orphans
# Run the nginx server
echo "Starting Nginx server..."
cd nginx
docker compose up --build --force-recreate -d

echo "Web server is up and running."

# TODO: Add coolify