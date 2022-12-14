#!/bin/bash
RED='\033[0;31m'
CYAN="\[\033[0;36m\]"
sudo apt-get update && sudo apt upgrade -y

mkdir ~/lab
cd ~/lab

printf ${RED}'Installing Volatility 2 and 3\n'${CYAN}
sudo apt install curl -y
sudo apt-get install -y build-essential git libdistorm3-dev yara libraw1394-11 libcapstone-dev capstone-tool tzdata
sudo apt-get install -y python2 python2.7-dev libpython2-dev
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
sudo python2 -m pip install -U setuptools wheel
python2 -m pip install -U distorm3 yara pycrypto pillow openpyxl ujson pytz ipython capstone
sudo python2 -m pip install yara
sudo ln -s /usr/local/lib/python2.7/dist-packages/usr/lib/libyara.so /usr/lib/libyara.so
python2 -m pip install -U git+https://github.com/volatilityfoundation/volatility.git
sudo apt install -y python3 python3-dev libpython3-dev python3-pip python3-setuptools 
sudo apt install -y python3-wheel
python3 -m pip install -U distorm3 yara pycrypto pillow openpyxl ujson pytz ipython capstone
python3 -m pip install -U git+https://github.com/volatilityfoundation/volatility3.git
echo "export PATH=/home/$USER/.local/bin:$PATH" >> ~/.bashrc
sudo apt install -y git 
git clone https://github.com/superponible/volatility-plugins.git
sudo cp ~/lab/volatility-plugins/* ~/.local/lib/python2.7/site-packages/volatility/plugins/

printf ${RED}'Press ENTER to continue\n'${CYAN}
read a
printf ${RED}'Installing Docker\n'${CYAN}
sudo apt install gnome-terminal -y
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo docker pull dominicbreuker/stego-toolkit

printf ${RED}'Press ENTER to continue\n'${CYAN}
read a

printf ${RED}'Install Autopsy\n'${CYAN}
sudo apt install -y autopsy

printf ${RED}'Install Wireshark and related tools\n'${CYAN}
sudo apt install wireshark

printf ${RED}'Please make sure you choose "YES" while installing Wireshark\n'${CYAN}
read a
sudo dpkg-reconfigure wireshark-common
sudo usermod -a -G wireshark ubuntu
sudo apt install tshark -y
wget https://github.com/odedshimon/BruteShark/releases/latest/download/BruteSharkCli && chmod 777 BruteSharkCli && ./BruteSharkCli --help

printf ${RED}'Install John the Ripper & Hashcat & Wordlists\n'${CYAN}
sudo apt-get install hashcat -y
sudo apt install john -y
git clone https://github.com/danielmiessler/SecLists.git
git clone https://github.com/3ndG4me/KaliLists.git
cd KaliLists/ 
gunzip rockyou.txt.gz 
cd ~ 

printf ${RED}'Press ENTER to continue\n'${CYAN}
read a
sudo apt update
sudo apt install -y neofetch lolcat htop bpytop bison flex dwarfdump
sudo apt upgrade 
printf ${RED}'Do you want to reboot the system? If not, please do it manually to make sure everything is working fine!\n'${CYAN}
read a
sudo reboot -f