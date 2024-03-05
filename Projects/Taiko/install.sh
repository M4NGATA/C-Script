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
    sudo apt-get install ca-certificates curl gnupg lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update apt index
    sudo apt-get update

# Install Docker
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Install Docker Compose
    sudo apt install docker-compose

# Set permissions
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Clone eth-docker repository
    git clone https://github.com/eth-educators/eth-docker
    cd eth-docker

# Configure eth-docker
    ./ethd config