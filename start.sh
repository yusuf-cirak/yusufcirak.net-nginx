mkdir -p ../web-server

# copy beszel compose file to web-server directory
cp ./beszel ../web-server/beszel -r
cp ./nginx ../web-server/nginx -r

# change directory to web-server
cd ../web-server
echo "Starting Beszel Hub..."

# First run Beszel Hub
docker compose -f beszel/docker-compose.yml up -d

# Run the nginx server
echo "Starting Nginx server..."
cd nginx
docker compose up --build --force-recreate -d

echo "Web server is up and running."

# TODO: Add coolify