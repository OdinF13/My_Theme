#!/bin/bash
os="$(lsb_release -si)"

#clear
#if ! [[ "${os}" == "Kali" ]]; then 
#echo "script is for kali linux..."
#exit
#fi

echo -e "\t\tDownloading source files"
sleep 0.7
clear


cd /root/Desktop
git clone https://github.com/OdinF13/My_Theme
cd My_Theme

############### <GTK>
unzip Arc-Lights-Dark.zip -d /usr/share/themes
cd /usr/share/themes
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Lights-Dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Lights-Dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Lights-Dark'
############## </GTK>

cd /root/Desktop/My_Theme
unzip mate.zip -d /usr/share/icons

############ Icon <Icon>
cd /root/Desktop/My_Theme
unzip Papirus.zip -d /usr/share/icons
cd /usr/share/icons
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
########## </Icon>

########## <Wallpaper>
cd /root/Pictures/Wallpapers
wget https://i.imgsafe.org/12/12450da992.jpeg 
gsettings set org.gnome.desktop.background picture-uri 'file:///root/Pictures/Wallpapers/12450da992.jpeg'
######### </Wallpaper>

cd /root/Desktop/
rm -rf My_Theme
clear
echo "Done.."
