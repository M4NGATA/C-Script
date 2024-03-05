#!/bin/bash -e
mainmenu() { 
  	echo "$(printBYellow 'Вы действительно хотите удалить Babylon') $(printBRedBlink '!!!')"

	echo "$(printBRed '1) Да')"
	echo "$(printBGreen '2) Нет')"
		
	echo -ne "$(printBGreen ' Ввод')$(printGreenBlink ': ')"
	read -r ans
	case $ans in
		1) yes ;;
		2) no ;;
		*) clear && printlogo && echo "$(printBRed ' Неверный запрос!')" && mainmenu ;;
	esac
}

no(){
	source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Babylon/main.sh)
}

yes(){
clear && printlogo
echo -ne "	

$(printBYellow 'Удаляем.....!')"
sudo systemctl disable babylon
sudo rm /etc/systemd/system/babylon.service
sudo systemctl daemon-reload
rm -rf $HOME/.babylond 
rm -rf babylon
sudo rm -rf $(which babylond)
cd $HOME
}

submenu(){
	echo -ne "
	$(printBGreen    'Babylon полностью удален с вашего сервера ')$(printBGreenBlink '!!!')
	
	Нажмите Enter:  "
	read -r ans
	case $ans in
		*)
		source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Babylon/main.sh)
		;;
	esac
}

mainmenu

