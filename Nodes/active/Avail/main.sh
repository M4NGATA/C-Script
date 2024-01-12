#!/bin/bash
	clear && source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Common/theme.sh) && printlogo
mainmenu() { 
		echo "$(printBRed ' AVAIL')"
		echo "$(printBGreen ' 1 ')Установить"
		echo "$(printBGreen ' 2 ')Удалить"
		echo "$(printBGreen ' 3 ')Инфо"
		echo ' ---------'
		echo "$(printBBlue '  0 ')Назад"
		echo "$(printBRed ' 10 ')Выход"
		echo ' ---------'
		echo -ne "$(printBGreen ' Ввод')$(printGreenBlink ': ')"
#	Свойства меню
read -r ans
	case $ans in
		1)
        source <(curl -s https://raw.githubusercontent.com/M4NGATA/X-Script/main/Nodes/active/Avail/install.sh)
		;;
        
		2)
		clear && printlogo && mainmenu
		;;
        
		3)
		info
		;;

		0)
		source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Menu/menu_nodes.sh)
		;;

		10)
		echo $(printBCyan '	"Bye bye."') && exit
		;;

		*)
		clear && printlogo && echo "$(printBRed ' Неверный запрос!')" && mainmenu
		;;
	esac
}

 

info(){
	clear && printlogo
	echo "$(printBYellow ' -------------------------------------')"
	echo Avail — это модульный блокчейн, ориентированный на доступность данных,
	echo позволяющий эффективно проверять данные блока без загрузки всего блока.
	echo Этот подход поддерживает различные среды выполнения и разнообразные конструкции, 
	echo такие как независимые цепочки приложений ZK, накопительные пакеты и т. д.
	echo "$(printBYellow ' -------------------------------------')"
	mainmenu
}


mainmenu