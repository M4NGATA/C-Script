#!/bin/bash
	clear && source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Common/theme.sh) && printlogo
    mainmenu() {
		echo "$(printBYellow ' NAMADA')"
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
    source <(curl -s https://raw.githubusercontent.com/M4NGATA/C-Script/main/Nodes/active/Namada/main.sh)
}

yes(){

#Download CometBFT     
    mkdir -p $HOME/.local/bin
    curl -sL https://github.com/cometbft/cometbft/releases/download/v0.37.2/cometbft_0.37.2_linux_amd64.tar.gz | tar -C $HOME/.local/bin -xzf- cometbft


#Install Rust
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"

#Update system and install build tools 
    sudo apt -q update
    sudo apt -qy install make git-core libssl-dev pkg-config libclang-12-dev libudev-dev build-essential protobuf-compiler
    sudo apt -qy upgrade

#Build Namada 
    cd $HOME
    rm -rf public-testnet-15.0dacadb8d663
    git clone -b v0.28.1 https://github.com/anoma/namada.git public-testnet-15.0dacadb8d663
    cd public-testnet-15.0dacadb8d663
    make build-release
    for BIN in namada namadac namadan namadar namadaw; do install -m 0755 target/release/$BIN $HOME/.local/bin/$BIN; done

#Create SystemD service unit 
sudo tee /etc/systemd/system/namada.service > /dev/null << EOF
[Unit]
Description=Namada node
After=network-online.target

[Service]
User=$USER
ExecStart=$HOME/.local/bin/namada node ledger run
Restart=always
RestartSec=10
LimitNOFILE=65535
Environment="CMT_LOG_LEVEL=p2p:none,pex:error"
Environment="NAMADA_CMT_STDOUT=true"
Environment="NAMADA_LOG=info"
Environment="PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:$HOME/.local/bin"

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable namada.service

#Initialize the node
export PATH=$HOME/.local/bin:$PATH
namada client utils join-network --chain-id public-testnet-15.0dacadb8d663

export CUSTOM_PORT=266
sed -i \
  -e "s|^proxy_app = \"tcp://127.0.0.1:26658\"|proxy_app = \"tcp://127.0.0.1:${CUSTOM_PORT}58\"|" \
  -e "s|^laddr = \"tcp://127.0.0.1:26657\"|laddr = \"tcp://127.0.0.1:${CUSTOM_PORT}57\"|" \
  -e "s|^laddr = \"tcp://0.0.0.0:26656\"|laddr = \"tcp://0.0.0.0:${CUSTOM_PORT}56\"|" \
  -e "s|^prometheus_listen_addr = \":26660\"|prometheus_listen_addr = \":${CUSTOM_PORT}66\"|" \
  $HOME/.local/share/namada/public-testnet-15.0dacadb8d663/config.toml

#Start service and check the logs 
    sudo systemctl start namada.service

}