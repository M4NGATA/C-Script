#!/bin/bash -e

taiko_menu() {
echo -e "\e[1;35m
╔╦╗╔═╗╦╦╔═╔═╗
 ║ ╠═╣║╠╩╗║ ║
 ╩ ╩ ╩╩╩ ╩╚═╝\e[0m"

    echo " 1. Start node"
    echo " 2. Stop node"
    echo " 3. Restart node"
    echo " 4. View grafana dashboard"
    echo " 5. View all logs"
    echo " 6. View execution logs"
    echo " 7. View client driver logs"
    echo " 8. View client proposer logs"
    echo " 9. View system resource usage stats"
    echo " ---------"
    echo "  0. Back"
    echo " 10. Exit"
    echo " ---------"
    echo -ne "Input: "
    read -r ans

    case $ans in
        1) docker compose -f simple-taiko-node/docker-compose.yml up -d ;;
        2) docker compose -f simple-taiko-node/docker-compose.yml down ;;
        3) docker compose -f simple-taiko-node/docker-compose.yml down && docker compose -f simple-taiko-node/docker-compose.yml up -d ;;
        4) open http://localhost:3001/d/L2ExecutionEngine/l2-execution-engine-overview ;;
        5) docker compose -f simple-taiko-node/docker-compose.yml logs -f --tail=2000 ;;
        6) docker compose -f simple-taiko-node/docker-compose.yml logs -f l2_execution_engine --tail=2000 ;;
        7) docker compose -f simple-taiko-node/docker-compose.yml logs -f taiko_client_driver --tail=2000 ;;
        8) docker compose -f simple-taiko-node/docker-compose.yml logs -f taiko_client_proposer --tail=2000 ;;
        9) docker stats ;;
        0) source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Projects/Taiko/main.sh) ;;
        10) echo "Bye bye." && exit ;;
        *) clear && echo "Invalid input!" && taiko_menu ;;
    esac
}


taiko_menu