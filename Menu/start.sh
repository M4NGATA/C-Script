#!/bin/bash

mainmenu() {
    clear && echo -e "\e[34m
╔═╗╦╔╦╗╔═╗╔╦╗╔═╗╦  
║  ║ ║ ╠═╣ ║║║╣ ║  
╚═╝╩ ╩ ╩ ╩═╩╝╚═╝╩═╝\e[0m"
    echo " 1) Nodes"
    echo " 2) Smart Contracts"
    echo " 3) Server"
    echo " --------"
    echo " 10) Exit"
    echo " --------"
    read -p "Enter the action number: " ans
    case $ans in
        1) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Menu/menu_nodes.sh) ;;
        2) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Menu/menu_smart.sh) ;;
        3) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Function/server/server.sh) ;;
        10) echo "Goodbye." && exit ;;
        *) echo "Invalid request!" && mainmenu ;;
    esac
}

mainmenu