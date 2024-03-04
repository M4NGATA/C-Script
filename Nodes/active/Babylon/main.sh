#!/bin/bash -e

# Function to print main menu
mainmenu() { 
clear && echo -e "\e[1;33m
╔╗ ╔═╗╔╗ ╦ ╦╦  ╔═╗╔╗╔
╠╩╗╠═╣╠╩╗╚╦╝║  ║ ║║║║
╚═╝╩ ╩╚═╝ ╩ ╩═╝╚═╝╝╚╝\e[0m"
    echo " 1. Manage"
    echo " 2. Install"
    echo " 3. Delete"
    echo " 5. Info"
    echo " ---------"
    echo " 0. Back"
    echo " 10. Exit"
    echo " ---------"
    echo -ne "Input: "
    read -r ans

    case $ans in
        1) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Babylon/control.sh) ;;
        2) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Babylon/install.sh) ;;
        3) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Babylon/delete.sh) ;;
        4) info ;;
        0) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Menu/menu_nodes.sh) ;;
        10) echo "Bye bye." && exit ;;
        *) clear && echo "Invalid input!" && mainmenu ;;
    esac
}

# Function to display information about Babylon
info(){
    clear
    echo "-------------------------------------"
    echo "Babylon is a new Cosmos project aimed at using Bitcoin security"
    echo "to enhance the security of Cosmos zones and other PoS chains. The"
    echo "Babylon team claims to be the first platform to offer Bitcoin"
    echo "to the PoS world. The Babylon Bitcoin staking protocol provides"
    echo "a way to integrate Bitcoin as a staking asset for PoS chains."
    echo "-------------------------------------"
    mainmenu
}

mainmenu