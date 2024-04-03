#!/bin/bash -e

echo -e "\e[1;35m
╔╦╗╔═╗╦╦╔═╔═╗
 ║ ╠═╣║╠╩╗║ ║
 ╩ ╩ ╩╩╩ ╩╚═╝\e[0m"

 read -p $'\e[1;31mDo you want to proceed with deleting the Taiko node? [Y/n]: \e[0m' choice
choice="${choice:-y}"
    if [[ $choice =~ ^[Yy]$ ]]; then
        echo "Starting the deletion of the Taiko node..."
    else
        echo "Deletion aborted."
        source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Projects/Taiko/main.sh)
        exit 1
    fi

    cd simple-taiko-node
    docker compose down -v
    cd ..

    echo -e "\e[1;32mTaiko node deletion completed.\e[0m Press Enter to continue..."
    read
    source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Projects/Taiko/main.sh)
