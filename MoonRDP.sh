#! /bin/bash
printf "Instalando o RDP Tenha Patiencia... " >&2
{
sudo useradd -m MOON
sudo adduser MOON sudo
echo 'MOON:3301' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install firefox
google-chrome http://www.twicth.tv/daluatv
firefox http://www.twicth.tv/daluatv
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser MOON chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copiar o comando do Debian Linux e cole aqui\n'
read -p "Paste Here: " CRP
su - MOON -c """$CRP"""
printf 'Entre no Link > https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Concluído " >&2
else
    printf "\n\nError Occured " >&2
fi
