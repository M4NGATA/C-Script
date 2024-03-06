#!/bin/bash -e

echo -e "\e[1;35m
╔╦╗╔═╗╦╦╔═╔═╗
 ║ ╠═╣║╠╩╗║ ║
 ╩ ╩ ╩╩╩ ╩╚═╝\e[0m"

echo -e "\nTo proceed with \e[1;35mTaiko\e[0m node installation, recommended resources are:"
echo -e "\e[1;32mRecommended: 4 CPU, 16 GB RAM, 1 TB NVMe\e[0m"
echo -e "\e[1;31mMinimum: 4 CPU, 8 GB RAM, 400 GB SSD or NVMe\e[0m"

read -p $'\e[1;33mEnter L1_ENDPOINT_HTTP: \e[0m' l1_endpoint_http
read -p $'\e[1;33mEnter L1_ENDPOINT_WS: \e[0m' l1_endpoint_ws

# Install dependencies
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common git

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Add current user to Docker group
sudo usermod -aG docker $USER

# Clone Taiko node repository
git clone https://github.com/taikoxyz/simple-taiko-node.git
cd simple-taiko-node

# Configure Taiko node
cp .env.sample .env

# Set L1_ENDPOINT_HTTP and L1_ENDPOINT_WS in .env file
echo "L1_ENDPOINT_HTTP=$l1_endpoint_http" >> .env
echo "L1_ENDPOINT_WS=$l1_endpoint_ws" >> .env

# Start Taiko node using docker-compose
echo -e "\nStarting Taiko node..."
docker-compose up -d

# Get the current IP address
ip=$(curl -s https://ipinfo.io/ip)

# Print completion message in green color
echo -e "\n\e[1;32mTaiko node installation completed successfully!\e[0m"

# Display the dashboard URL
echo -e "\nTaiko node dashboard is accessible at:"
echo -e "http://$ip:3001/d/L2ExecutionEngine/l2-execution-engine-overview?orgId=1&refresh=10s"



