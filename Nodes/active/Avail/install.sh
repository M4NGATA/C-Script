#!/bin/bash
	clear && source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Common/theme.sh) && printlogo
    mainmenu() {
		echo "$(printBYellow ' AVAIL')"
		echo "$(printGreen  '--------------------------------------')"
        echo "$(printYellow 'Рекомендуемые требования к оборудованию.')"
		echo "$(printBCyan  '	4CPU 8RAM 200GB')"
		echo "$(printGreen  '--------------------------------------')"
	    echo "$(printCyan	'Вы действительно хотите начать установку') $(printCyanBlink '???')"
        echo ' -------'
	    echo "$(printGreen	'  1 Да')"
	    echo "$(printRed	'  2 Нет')"
		echo ' -------'
        echo -ne "$(printBGreen ' Ввод')$(printGreenBlink ': ')"
                read -r ans
	            case $ans in
		        1)
		        yes
		        ;;

		        2)
		        no
		        ;;
		        *)
		        clear && printlogo && echo "$(printBRed ' Неверный запрос!')" && mainmenu
        	    ;;
                esac
    }


no(){
    source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Avail/main.sh)
}

yes(){
#Setup validator name
read -r -p " $(printBGreen 'Укажите имя валидатора:') " NODENAME


AVAIL_PORT=30333
echo "export NODENAME=$NODENAME" >> $HOME/.bash_profile
echo "export AVAIL_PORT=${AVAIL_PORT}" >> $HOME/.bash_profile
source $HOME/.bash_profile


sudo apt update && sudo apt upgrade -y
sudo apt install curl tar wget clang pkg-config protobuf-compiler libssl-dev jq build-essential protobuf-compiler bsdmainutils git make ncdu gcc git jq chrony liblz4-tool -y


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
rustup default stable
rustup update
rustup update nightly
rustup target add wasm32-unknown-unknown --toolchain nightly


git clone https://github.com/availproject/avail.git
cd avail
mkdir -p data
git checkout v1.8.0.5
cargo build --release -p data-avail
sudo cp $HOME/avail/target/release/data-avail /usr/local/bin

sudo tee /etc/systemd/system/availd.service > /dev/null <<EOF
[Unit]
Description=Avail Validator
After=network-online.target

[Service]
User=$USER
ExecStart=$(which data-avail) -d `pwd`/data --chain goldberg --validator --name $NODENAME
Restart=on-failure
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF


sudo systemctl daemon-reload
sudo systemctl enable availd
sudo systemctl restart availd
cd
submenu
}

submenu(){

	    echo "$(printBGreen    'УСТАНОВКА ЗАВЕРШЕНА........') $(printBGreenBlink '!!!') "
	    echo "$(printGreen  '--------------------------------------')"
 		echo "$(printBGreen ' 1 ')Просмотреть логи"
 		echo "$(printBGreen ' 2 ')В меню"
        echo -ne "$(printBGreen ' Ввод')$(printGreenBlink ': ')"
	read -r ans
	case $ans in
		1)
		subsubmenu
		;;
		2)
		source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Avail/main.sh)
		;;
		*)
		clear && printlogo && echo "$(printBRed ' Неверный запрос!')" && mainmenu
		;;
	esac
}

subsubmenu(){
	echo -ne "
	$(printYellow    'Для того что бы остановить журнал логов надо нажать') $(printBCyan 'CTRL+C') $(printYellow '!!!')
	$(printBCyan 'Для продолжения нажмите Enter:')  "
		read -r ans
		case $ans in
			*)
			sudo journalctl -u availd -f -o cat
			submenu
			;;
	esac
}

mainmenu