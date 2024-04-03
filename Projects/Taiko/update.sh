#!/bin/bash -e

echo -e "\e[1;35m
╔╦╗╔═╗╦╦╔═╔═╗
 ║ ╠═╣║╠╩╗║ ║
 ╩ ╩ ╩╩╩ ╩╚═╝\e[0m"
# Запрос у пользователя подтверждения для продолжения
read -p "Continue update? (y/n): " answer
if [[ $answer != "y" && $answer != "Y" ]]; then
    echo "Обновление отменено."
    clear && source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Projects/Taiko/main.sh)
    exit 1
fi

cd simple-taiko-node
git pull origin main && docker compose pull
docker compose down && docker compose up -d
cd

echo -e "\e[1;32m\nThe update is completed. To continue click Enter.\e[0m"
read -p "Press Enter to continue..."
source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Projects/Taiko/main.sh)
