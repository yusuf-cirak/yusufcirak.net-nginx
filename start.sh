# First create the web server if not exist
# Run the docker-compose.yml file
docker compose up --force-recreate --build -d

echo "Web server is up and running."


# Run beszel compose
# mkdir -p ./beszel_ssh

# if [ ! -f ./beszel_ssh/id_rsa ]; then
#   ssh-keygen -t rsa -b 4096 -f ./beszel_ssh/id_rsa -N ""
# fi

# if [ ! -f ./beszel_ssh/token ]; then
#   openssl rand -hex 16 > ./beszel_ssh/token
# fi

# export BESZEL_KEY="$(cat ./beszel_ssh/id_rsa.pub)"
# export BESZEL_TOKEN="$(cat ./beszel_ssh/token)"

docker compose -f ./beszel/docker-compose.yml up -d
echo "Beszel is up and running."

# TODO: Add coolify