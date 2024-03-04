#!/bin/bash

mainmenu() {
    clear && echo -e "\e[1;32m
╔╗╔╔═╗╔╦╗╔═╗╔═╗
║║║║ ║ ║║║╣ ╚═╗
╝╚╝╚═╝═╩╝╚═╝╚═╝\e[0m"
#--------------------------
    echo " 1) Babylon"
    echo " 2) Shardeum"
    echo " 3) Avail"
    echo " 4) Zora"
    echo " 5) Elixir"
    echo " 6) Holograph"
    echo " ---------"
    echo " 9) Archive"
    echo " ---------"
    echo " 0) Back"
    echo " 10) Exit"
    echo " ---------"
    read -p "Enter action number: " ans
    case $ans in
        1) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Babylon/main.sh) ;;
        2) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Shardeum/main.sh) ;;
        3) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Avail/main.sh) ;;
        4) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Zora/main.sh) ;;
        5) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Elixir/main.sh) ;;
        6) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Holograph/main.sh) ;;
        9) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Menu/archive_nodes.sh) ;;
        0) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Menu/start.sh) ;;
        10) echo "До свидания." && exit ;;
        *) echo "Неверный запрос!" && mainmenu ;;
    esac
}

mainmenu
