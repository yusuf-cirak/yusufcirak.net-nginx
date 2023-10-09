# # Create a folder named "web-server" in the home directory if not exists
# if [ ! -d ~/web-server ]; then
#   mkdir ~/web-server
# fi

# # Copy the files from the current directory to the "web-server" folder
# cp -r . ~/web-server

# # Change directory to the "web-server" folder
# cd ~/web-server

# Run the docker-compose.yml file
docker-compose up --force-recreate --build -d