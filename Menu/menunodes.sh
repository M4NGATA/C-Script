#!/bin/bash

# Подгрузка общих функций и цвета
	clear && source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Common/theme.sh) && printlogo
# Шапка скрипта
	echo "$(printBMagenta ' НОДЫ')"
# Основное меню
	mainmenu() {
		echo "$(printBGreen ' 1)') Nibiru"
		echo "$(printBGreen ' 2)') Shardeum"
		echo "$(printBGreen ' 3)') Starknet"
		echo "$(printBGreen ' 4)') 5ireChain"
		echo "$(printBGreen ' 5)') Elixir"
		echo "$(printBGreen ' 6)') Holograph"
		echo "$(printBGreen ' 7)') Fleek"
		echo
		echo "$(printBGreen ' 8)') $(printBYellow 'Архив')"
		echo ' --------'
		echo "$(printBBlue ' 9)') $(printBYellow 'Назад')"
		echo "$(printBRed ' 0) Выход')"
		echo ' --------'
		echo -ne "$(printBGreen ' Ввод')$(printGreenBlink ':')"
#	Свойства меню
			read -r ans
				case $ans in
		#-------------------#
			1)
			source <(curl -s https://raw.githubusercontent.com/dzhagerr/xl1/main/xscript/nodes/active/nibiru/main.sh)
			;;
		#-------------------#
			2)
			source <(curl -s https://raw.githubusercontent.com/dzhagerr/xl1/main/xscript/nodes/active/shardeum/main.sh)
			;;
		#-------------------#
			3)
			source <(curl -s https://raw.githubusercontent.com/dzhagerr/xl1/main/xscript/nodes/active/starknet/main.sh)
			;;
		#-------------------#
			4)
			clear && printlogo && printComing && mainmenu
			;;
		#-------------------#
			5)
			source <(curl -s https://raw.githubusercontent.com/dzhagerr/xl1/main/xscript/nodes/active/elixir/main.sh)
			;;
		#-------------------#
			6)
			source <(curl -s https://raw.githubusercontent.com/dzhagerr/xl1/main/xscript/nodes/active/holograph/main.sh)
			;;
		#-------------------#
			7)
			source <(curl -s https://raw.githubusercontent.com/dzhagerr/xl1/main/xscript/nodes/active/Fleek/main.sh)
			;;
		#-------------------#
			8)
			source <(curl -s https://raw.githubusercontent.com/dzhagerr/xl1/main/xscript/menu/archivenodes.sh)
			;;
		#-------------------#
			9)
			source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Menu/start.sh)
			;;
		#-------------------#
			0)
			echo $(printBCyan '	"Bye bye."') && exit
			;;
		#-------------------#
			*)
			clear && printlogo
			echo " $(printCyanBlink '                 =====================')"
			echo " $(printRed  '================')$(printCyanBlink ' = ')$(printBRed 'Неверный запрос! ')$(printCyanBlink ' = ')$(printRed  '================')"
			echo " $(printCyanBlink '                 =====================')"
			mainmenu
			;;
		#-------------------#
		esac
		}

	back(){
	./x-l1bra
	}
#-----------------------------------------------------------------------------------#
mainmenu