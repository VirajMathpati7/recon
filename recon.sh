#!/bin/bash

domain=$1

RED="\033[1;31m"
RESET="\033[0m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"

read -p "$(echo -e "${CYAN} Please enter the path to your wordlist : ..${RESET}") " wordlist

if [ -z "$wordlist" ]; then
     echo -e "${RED} [+] Using provided wordlist: $wordlist ${RESET}"
fi

check_and_install() {
    TOOL=$1
    INSTALL_CMD=$2

    if ! command -v $TOOL &> /dev/null; then
        echo -e "${RED} [!] $TOOL is not installed. Installing... ${RESET}"
        eval $INSTALL_CMD
        if ! command -v $TOOL &> /dev/null; then
            echo -e "${RED} [!] Failed to install $TOOL. Please install it manually. ${RESET}"
            exit 1
        fi
    else
        echo -e "${RED} [+] $TOOL is already installed. ${RESET}"
    fi
}

subdomain_path=$domain/subdomains
screenshot_path=$domain/screenshots
scan_path=$domain/scans
ffuf_path=$domain/ffuf

if [ ! -d "$domain" ];then
	mkdir $domain 
fi

if [ ! -d "$subdomain_path" ];then
	mkdir $subdomain_path
fi

if [ ! -d "$screenshot_path" ];then
	mkdir $screenshot_path
fi

if [ ! -d "$scan_path" ];then
	mkdir $scan_path
fi

if [ ! -d "$ffuf_path" ];then
	mkdir $ffuf_path
fi

check_and_install "subfinder" "go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
check_and_install "httprobe" "go install github.com/tomnomnom/httprobe@latest"
check_and_install "gowitness" "go install github.com/sensepost/gowitness@latest"
check_and_install "ffuf" "go install github.com/ffuf/ffuf/v2@latest"


echo -e "${RED} [+] Launching subfinder ... ${RESET}"
echo -e "${YELLOW} [-]Let's take a cup of coffee...${RESET}"
subfinder -d $domain -v > $subdomain_path/found.txt

echo -e "${RED} [+] Launching httprobe ... ${RESET}"
echo -e "${YELLOW} [-] Oh here we go for live domains...${RESET}"
cat $subdomain_path/found.txt | grep $domain | sort -u | httprobe -prefer-https | grep https | sed 's/https\?:\/\///' | tee -a $subdomain_path/alive.txt

echo -e "${RED} [+] Launching gotwitness ... ${RESET}"
echo -e "${YELLOW} [-] Let's capture some moments ... ${RESET}"
gowitness scan file -f $subdomain_path/alive.txt -s $screenshot_path/ --no-http 

echo -e "${RED} [+] Launching nmap ... ${RESET}"
echo -e "${YELLOW} [-] Can i get some loopholes ... ${RESET}"
nmap -iL $subdomain_path/alive.txt -T4 -p1-1000 -oN $scan_path/open_ports.txt -v

echo -e "${RED} [+] Launching ffuf... ${RESET}"
echo -e "${YELLOW} [-] Let's check the family of domain ...${RESET}"
ffuf -w $wordlist -u https://$domain/FUZZ -mc 200,403,301 -c -fs 42 -v > $ffuf_path/directories.txt








