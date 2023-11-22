#!/bin/bash

# Подгрузка общих функций и цвета
	clear && source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Common/theme.sh) && printlogo

# Шапка скрипта
	echo "$(printBMagenta ' ELIXIR    ')"
mainmenu() {
    echo -ne "
$(printBRed    'Вы действительно хотите удалить Elixir ') $(printBRedBlink '!!!')

	$(printRed   '1) Да')
	$(printGreen '2) Нет')

	$(printBCyan 'Введите цифру:') "
	read -r ans
	case $ans in
		1)
		yes
		;;
		2)
		no
		;;

		*)
		clear
		printlogo && printelixir
		echo
		echo
		echo    -ne "$(printRed '		   Неверный запрос !')"
		echo
		mainmenu
		;;
	esac
}

no(){
source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/Nodes/Active/Elixir/main.sh)
}

yes(){
clear
printlogo && echo "$(printBMagenta ' ELIXIR    ')"
echo -ne "

$(printBYellow 'Удаляем.....!')"
cd $HOME
docker kill ev
docker rm ev
submenu
}

submenu(){
	echo -ne "
	$(printBGreen    'Elixir полностью удален с вашего сервера ')$(printBGreenBlink '!!!')

	Нажмите Enter:  "
	read -r ans
	case $ans in
		*)
		source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/Nodes/Active/Elixir/main.sh)
		;;
	esac
}


mainmenu