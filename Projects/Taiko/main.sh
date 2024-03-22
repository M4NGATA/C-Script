#!/bin/bash -e
mainmenu() {
echo -e "\e[1;35m
╔╦╗╔═╗╦╦╔═╔═╗
 ║ ╠═╣║╠╩╗║ ║
 ╩ ╩ ╩╩╩ ╩╚═╝\e[0m"

    echo " 1. Control"
    echo " 2. Install"
    echo " 3. Update"
    echo " 4. Delete"
    echo " ---------"
    echo "  0. Back"
    echo " 10. Exit"
    echo " ---------"
    echo -ne "Input: "
    read -r ans

    case $ans in
        1) clear && source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Projects/Taiko/control.sh) ;;
        2) clear && source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Projects/Taiko/install.sh) ;;
        4) clear && source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Projects/Taiko/delete.sh) ;;
        3) clear && source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Projects/Taiko/update.sh) ;;
        0) clear && source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Menu/menu_nodes.sh) ;;
        10) echo "Bye bye." && exit ;;
        *) clear && echo "Invalid input!" && mainmenu ;;
    esac
}

mainmenu