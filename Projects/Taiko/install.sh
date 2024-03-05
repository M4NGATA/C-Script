#!/bin/bash -e
echo -e "\e[1;35m
╔╦╗╔═╗╦╦╔═╔═╗
 ║ ╠═╣║╠╩╗║ ║
 ╩ ╩ ╩╩╩ ╩╚═╝\e[0m"

echo -e "\nTo proceed with \e[1;35mTaiko\e[0m node installation, recommended resources are:"
echo -e "\e[1;32mRecommended: 4 CPU, 16 GB RAM, 1 TB NVMe\e[0m"
echo -e "\e[1;31mMinimum: 4 CPU, 8 GB RAM, 400 GB SSD or NVMe\e[0m"

read -p "Do you want to proceed with Taiko node installation? [Y/n]: " choice
choice="${choice:-y}"
if [[ $choice =~ ^[Yy]$ ]]; then
    echo "Starting Taiko node installation..."
else
    echo "Installation aborted."
    source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Projects/Taiko/main.sh)
    exit 1
fi

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