#!/bin/bash -e
mainmenu() {
echo -e "\e[1;35m
╔╦╗╔═╗╦╦╔═╔═╗
 ║ ╠═╣║╠╩╗║ ║
 ╩ ╩ ╩╩╩ ╩╚═╝\e[0m"

    echo " 1. Install"
    echo " 2. Update"
    echo " 3. Delete"
    echo " ---------"
    echo "  0. Back"
    echo " 10. Exit"
    echo " ---------"
    echo -ne "Input: "
    read -r ans

    case $ans in
        1) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Projects/Taiko/install.sh) ;;
        2) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Projects/Taiko/delete.sh) ;;
        3) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Projects/Taiko/update.sh) ;;
        0) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Menu/menu_nodes.sh) ;;
        10) echo "Bye bye." && exit ;;
        *) clear && echo "Invalid input!" && mainmenu ;;
    esac
}

mainmenu