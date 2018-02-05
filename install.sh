#!/bin/bash
clear 
IGreen='\033[0;92m'
IBlack='\033[0;90m'
RED='\033[0;31m'
NC='\033[0m'
UYellow='\033[4;33m'
IYellow='\033[0;93m' 
green=`tput setaf 2`
ICyan='\033[0;96m'
UWhite='\033[4;37m'
UPurple='\033[4;35m'
Blue='\033[1;34m'
URed='\033[4;31m'
os="$(lsb_release -si)"
username=$USER

COLUMNS=$(tput cols) 
title="Welcome To Theme Installer....." 
printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title"
echo ""
printf ${NC}"     ${UPurple}_______${NC}\n"
printf ${NC}"   ${UPurple}|${NC}        ${UPurple}|${NC}\n"
printf ${IGreen}"<______________>\n"
printf ${IGreen}"　(  ${NC}${RED}◥◣${IGreen} _ ${RED}◢◤${NC}${IGreen})                   ${NC}[${RED}+${NC}] Coded By ${RED}ÕÐÎN${NC}\n"
printf ${IGreen}"＿(__つ/￣￣/＿                ${Blue}As Simple As Possible${NC}\n"
printf ${IGreen}"　　＼/    /${NC}\n"
sleep 2
echo

clear
printf "\n\n${Blue}Testing Internet Connection${NC}\n"
sleep 2


#check internet

(( STAGE++ )); echo -e "\n\n ${NC}[${red}+${NC}] (${STAGE}/${TOTAL}) ${RED}Checking Internet Access${NC}"
    #--- Can we ping google?
    for i in {1..10}; do ping -c 1 -W ${i} www.google.com &>/dev/null && break; done
    #--- Run this, if we can't
    if [[ "$?" -ne 0 ]]; then
        echo -e ' '${RED}'[!]'${RESET}" ${RED}Possible DNS issues${RESET}(?)" 1>&2
        echo -e ' '${RED}'[!]'${RESET}" Will try and use ${YELLOW}DHCP${RESET} to 'fix' the issue" 1>&2
        chattr -i /etc/resolv.conf 2>/dev/null
        dhclient -r
        #--- Second interface causing issues?
        ip addr show eth1 &>/dev/null
        [[ "$?" == 0 ]] && route delete default gw 192.168.155.1 2>/dev/null
        #--- Request a new IP
        dhclient
        dhclient eth0 2>/dev/null
        dhclient wlan0 2>/dev/null
        #--- Wait and see what happens
        sleep 15s
        _TMP="true"
        _CMD="$(ping -c 1 8.8.8.8 &>/dev/null)"
        if [[ "$?" -ne 0 && "$_TMP" == "true" ]]; then
            _TMP="false"
            echo -e ' '${RED}'[!]'${RESET}" ${RED}No Internet access${RESET}" 1>&2
            echo -e ' '${RED}'[!]'${RESET}" You will need to manually fix the issue, before re-running this script" 1>&2
        fi
        _CMD="$(ping -c 1 www.google.com &>/dev/null)"
        if [[ "$?" -ne 0 && "$_TMP" == "true" ]]; then
            _TMP="false"
            echo -e ' '${RED}'[!]'${RESET}" ${RED}Possible DNS issues${RESET}(?)" 1>&2
            echo -e ' '${RED}'[!]'${RESET}" You will need to manually fix the issue, before re-running this script" 1>&2
        fi
        if [[ "$_TMP" == "false" ]]; then
            (dmidecode | grep -iq virtual) && echo -e " ${YELLOW}[i]${RESET} VM Detected"
            (dmidecode | grep -iq virtual) && echo -e " ${YELLOW}[i]${RESET} ${YELLOW}Try switching network adapter mode${RESET} (e.g. NAT/Bridged)"
            echo -e ' '${RED}'[!]'${RESET}" Quitting..." 1>&2
            exit 1
        fi
    else
        echo -e " ${YELLOW}[i]${RESET} ${YELLOW}You Have Internet Access${RESET}" 1>&2

              printf "${Blue}Starting Program${NC}\n"
		sleep 2

    fi









clear




printf ${NC}"     ${UPurple}_______${NC}\n"
printf ${NC}"   ${UPurple}|${NC}        ${UPurple}|${NC}\n"
printf ${IGreen}"<______________>\n"
printf ${IGreen}"　(  ${NC}${RED}◥◣${IGreen} _ ${RED}◢◤${NC}${IGreen})                   ${NC}[${RED}+${NC}] Coded By ${RED}ÕÐÎN${NC}\n"
printf ${IGreen}"＿(__つ/￣￣/＿                ${Blue}As Simple As Possible${NC}\n"
printf ${IGreen}"　　＼/    /${NC}\n"


echo "======================================================*"
printf "${Blue}Warnings!!!!${NC}\n"
echo "============"
sleep 1
printf "${UYellow}This Script Is Tested On Kali Linux And Works Correctly${NC}\n\n"
sleep 1
printf "${Blue}=>: ${RED}If You Have Problem: Check If ${green}Git and wget${RED} Are Or Not Installed\n"
printf "${Blue}=>: ${NC}If Not; {\n${UYellow}sudo apt-get install git -y${NC}\n}\n"
echo 
echo 
sleep 1
printf "${Blue}=>: ${UPurple}Check sources.list using command${NC} ${URed}nano /etc/apt/sources.list ${NC}\n"


printf "${Blue}=>:${UPurple} Getting Your Permission...${NC}\n\n"
echo 
##### check permission
printf "===========================\n"
printf "${Blue}=>:${green} Are You Agree To Continue?${NC}\n"
read -p "Yes "'"Y"'" / No "'"N"'": " -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]; then
clear
printf  "\n[!]${RED}You Have Accepted${NC}\nDownloading ${RED}GTK${NC} Theme...\n"






echo 
echo 
echo 



if [ "${os}" == "Debian" ] || [ "${os}" == "Kali" ]; then               # check os

printf "${Blue}=>:${NC}Downloading For${RED} Debian${NC} \n"

echo 
echo


printf "${Blue}=>: ${NC}Your OS's Name is ${RED} -${os}- ${NC}\n"


echo ""
echo ""
echo ""
cd ~/Desktop && mkdir Theme && cd Theme && wget https://github.com/darim92/arc-lights-gtk/archive/master.zip
unzip master.zip -d /usr/share/themes
cd ~ && cd /usr/share/themes/arc-lights-gtk-master
mv Arc-Lights-Darker ../
mv Arc-Lights-Dark ../


gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Lights-Dark'

clear
printf "${Blue}=>: ${NC}GTK3 Theme Installed ${RED}Succesfully${NC}\n"
sleep 1
clear
printf ${NC}"     ${UPurple}_______${NC}\n"
printf ${NC}"   ${UPurple}|${NC}        ${UPurple}|${NC}\n"
printf ${IGreen}"<______________>\n"
printf ${IGreen}"　(  ${NC}${RED}◥◣${IGreen} _ ${RED}◢◤${NC}${IGreen})                   ${NC}[${RED}+${NC}] Coded By ${RED}ÕÐÎN${NC}\n"
printf ${IGreen}"＿(__つ/￣￣/＿                ${Blue}As Simple As Possible${NC}\n"
printf ${IGreen}"　　＼/    /${NC}\n"

# icon download 
sleep 1

printf "\n\n${Blue}=>: ${NC}Downloading ${RED}Icon${NC} Theme....\n\n" 
set -e

gh_repo="papirus-icon-theme"
gh_desc="Papirus icon theme"

cat <<- EOF
      ppppp                         ii
      pp   pp     aaaaa   ppppp          rr  rrr   uu   uu     sssss
      ppppp     aa   aa   pp   pp   ii   rrrr      uu   uu   ssss
      pp        aa   aa   pp   pp   ii   rr        uu   uu      ssss
      pp          aaaaa   ppppp     ii   rr          uuuuu   sssss
                          pp
                          pp
  $gh_desc
  https://github.com/PapirusDevelopmentTeam/$gh_repo
EOF

DESTDIR="${DESTDIR:-/usr/share/icons}"
THEMES="${THEMES:-Papirus ePapirus Papirus-Dark Papirus-Light Papirus-Adapta Papirus-Adapta-Nokto}"
BRANCH="${BRANCH:-master}"
uninstall="${uninstall:-false}"

_msg() {
    echo "=>" "$@" >&2
}

_rm() {
    # removes parent directories if empty
    _sudo rm -rf "$1"
    _sudo rmdir -p "$(dirname "$1")" 2>/dev/null || true
}

_sudo() {
    if [ -w "$DESTDIR" ] || [ -w "$(dirname "$DESTDIR")" ]; then
        "$@"
    else
        sudo "$@"
    fi
}

_download() {
    _msg "Getting the latest version from GitHub ..."
    wget -O "$temp_file" \
        "https://github.com/PapirusDevelopmentTeam/$gh_repo/archive/$BRANCH.tar.gz"
    _msg "Unpacking archive ..."
    tar -xzf "$temp_file" -C "$temp_dir"
}

_uninstall() {
    for theme in "$@"; do
        _msg "Deleting '$theme' ..."
        _rm "$DESTDIR/$theme"
    done
}

_install() {
    _sudo mkdir -p "$DESTDIR"

    for theme in "$@"; do
        _msg "Installing '$theme' ..."
        _sudo cp -R "$temp_dir/$gh_repo-$BRANCH/$theme" "$DESTDIR"
        _sudo gtk-update-icon-cache -q "$DESTDIR/$theme" || true
    done

    # Try to restore the color of folders from a config
    if which papirus-folders > /dev/null 2>&1; then
        sudo papirus-folders -R || true
    fi
}

_cleanup() {
    _msg "Clearing cache ..."
    rm -rf "$temp_file" "$temp_dir"
    rm -f "$HOME/.cache/icon-cache.kcache"
    _msg "Done!"
}

trap _cleanup EXIT HUP INT TERM

temp_file="$(mktemp -u)"
temp_dir="$(mktemp -d)"

if [ "$uninstall" = "false" ]; then
    _download
    _uninstall $THEMES
    _install $THEMES
else
    _uninstall $THEMES
fi

gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
clear

printf "${RED}Downloaded Successfully${NC}"
sleep 1
clear 

printf ${NC}"     ${UPurple}_______${NC}\n"
printf ${NC}"   ${UPurple}|${NC}        ${UPurple}|${NC}\n"
printf ${IGreen}"<______________>\n"
printf ${IGreen}"　(  ${NC}${RED}◥◣${IGreen} _ ${RED}◢◤${NC}${IGreen})                   ${NC}[${RED}+${NC}] Coded By ${RED}ÕÐÎN${NC}\n"
printf ${IGreen}"＿(__つ/￣￣/＿                ${Blue}As Simple As Possible${NC}\n"
printf ${IGreen}"　　＼/    /${NC}\n"
sleep 1.5


printf "${Blue}=>:${NC}Downloading ${RED}background${NC} \n"
sleep 1
if [ $username == "root" ]; then
    

cd ~/
wget https://i.imgsafe.org/12/12450da992.jpeg 
gsettings set org.gnome.desktop.background picture-uri 'file:///root/12450da992.jpeg'





fi #background



 if [ $username != "root" ]; then
gsettings set org.gnome.desktop.background picture-uri 'file:///home/'$username'/Desktop/Theme/12450da992.jpeg'

fi


gsettings set org.gnome.desktop.interface document-font-name 'Ubuntu Medium 11'
gsettings set org.gnome.desktop.interface font-name 'Ubuntu Medium 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Bold 11'
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar 'false'
sudo gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar 'false'
gsettings set org.gnome.gedit.preferences.editor display-line-numbers 'true'
gsettings set org.gnome.shell.extensions.user-theme name "Arc-Lights-Dark"

clear
 printf "${Blue} Wallpaper Downloaded${NC}\n"
clear

printf ${NC}"     ${UPurple}_______${NC}\n"
printf ${NC}"   ${UPurple}|${NC}        ${UPurple}|${NC}\n"
printf ${IGreen}"<______________>\n"
printf ${IGreen}"　(  ${NC}${RED}◥◣${IGreen} _ ${RED}◢◤${NC}${IGreen})                   ${NC}[${RED}+${NC}] Coded By ${RED}ÕÐÎN${NC}\n"
printf ${IGreen}"＿(__つ/￣￣/＿                ${Blue}As Simple As Possible${NC}\n"
printf ${IGreen}"　　＼/    /${NC}\n"

printf " ${Blue}Downlaoding Cursors${NC}...\n\n"

sleep 2
cd /usr/share/icons/

mkdir tempob
cd tempob
git clone https://github.com/OdinF13/Cursor.git
cd Cursor
unzip Green-Cursor.zip
mv Green-Cursor ../../



cd ~
cd /usr/share/icons/


rm -rf tempob








gsettings set  org.gnome.desktop.interface cursor-theme 'Green-Cursor'


clear
printf ${NC}"     ${UPurple}_______${NC}\n"
printf ${NC}"   ${UPurple}|${NC}        ${UPurple}|${NC}\n"
printf ${IGreen}"<______________>\n"
printf ${IGreen}"　(  ${NC}${RED}◥◣${IGreen} _ ${RED}◢◤${NC}${IGreen})                   ${NC}[${RED}+${NC}] Coded By ${RED}ÕÐÎN${NC}\n"
printf ${IGreen}"＿(__つ/￣￣/＿                ${Blue}As Simple As Possible${NC}\n"
printf ${IGreen}"　　＼/    /${NC}\n"
sleep 1.5

printf "${Blue}=>: ${UWhite}Installation Finished....Enjoy${NC}\n" 

printf "${Blue}As Soon As Possible I Add New Features To This Script${NC}\n"

else 
	printf "${Blue}=>: ${NC}If you want to install this theme use ${RED}Debian Based Os${NC}"


fi ## check os end


# Special thank to OT Fluge











else 
clear  
printf "============================="  
printf "\n${green}=>:${RED}Unfortunatelly Aborted${NC}\n"
echo "      
    ▌▄▌▄▐▐▌█
    ▌▄▌▄▐▐▌▀
    ▀▀▀▀▀▀▀▀ "


fi 
