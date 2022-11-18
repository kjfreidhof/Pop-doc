#!/bin/bash 

# AUTHOR = Kyle Freidhof 

# Date created = /11/15/22

# License = GPL3

<<COMMENT
This script installs and removes all the stuff i use in pop os by runing it through the command line 
COMMENT
        
# tells the user what they are installing 
echo "This is my Pop os script this script"
sleep 3
echo "This automatically installs my packages i use and my configurations"
sleep 3
echo "Warning this script is my configurations
And i am not resposible for breaking your system
when you run this script"
sleep 3
echo "Do you want to install this script?
Press Enter to continue or ctrl c to exit"
read

# create skip varriable 
skip()
{

        echo"This Process will be continued : $1"
        continue





}

# checks if the user is root before installing
if [ $(whoami) = 'root' ]; then
        echo "You are root"

else
        printf "You are not root\n"
        printf "Make sure tou run this script with sudo\n"
        printf "or have root privilages\n"

        read
        exit
fi 




# asks the user if they want to update and upgrade their system or not 
echo "Do you want to update and upgrade the system? [1|2|3|4|5|]" 
echo "1, update" 
echo "2, upgrade"
echo "3, Both"
echo "4, continue without"
echo  "5, exit"

     

read -rp "= " CHOICE 

if [ "$CHOICE" = 1 ]; then 
        apt update -y
        $skip_str
elif [ "$CHOICE" = 2 ]; then
        apt upgrade -y 
        $skip_str
elif [ "$CHOICE" = 3 ]; then
        apt upgrade && apt upgrade -y
        $skip_str

elif [ "$CHOICE" = 4 ]; then
        echo "This Process will continue" 
        sleep 3
        $skip_str


elif [ "$CHOICE" = 5 ]; then
        echo "Exiting...."
        exit



else
        exit

fi

# removes and installls packages 

cat remove.txt | xargs apt remove -y


cat depend.txt | apt install -y 


wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

rm -f packages.microsoft.gpg

apt update 
sleep 3

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg


echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main'| tee /etc/apt/sources.list.d/vscodium.list

apt update 
sleep 3

echo "Vscode and Vscodium added to the index"
sleep 5
        

curl https://www.virtualbox.org/download/oracle_vbox_2016.asc | gpg --dearmor > oracle_vbox_2016.gpg
sleep 3 
curl https://www.virtualbox.org/download/oracle_vbox.asc | gpg --dearmor > oracle_vbox.gpg
sleep 3

install -o root -g root -m 644 oracle_vbox_2016.gpg /etc/apt/trusted.gpg.d/
sleep 3 
install -o root -g root -m 644 oracle_vbox.gpg /etc/apt/trusted.gpg.d/
sleep 3

echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

apt update 
sleep 3

echo "vbox added to the index"


cat pkg.txt | apt install -y

/sbin/vboxconfig







echo "qemu/kvm is installed"
sleep 3
echo "but you will need to"
sleep 3
echo "finsh setting it up your self"
sleep 3
echo "by making sure the daemon is runing"
sleep 3
echo "and adding your user to the neccessary groups"
sleep 3


echo "Do you want to remove firefox [y|n|x|] "
echo "y, Yes"
echo "n, No-continue"
echo "x, No-Exit"

read -rp "= " CHOICE

if [ "$CHOICE" = y ]; then
        cat firefox.txt | xargs apt remove -y
        $skip_str
elif [ "$CHOICE" = n ]; then 
        $skip_str

elif [ "$CHOICE" = x ]; then
        exit

else 
        exit


fi

echo "what other web browser do you want to install besides firefox [1|2|3|4|5]"
echo "1, Keep Firefox"
echo "2, chromium"
echo "3, Brave"
echo "4, qutebrowser"
echo "5, exit"

read -rp "= " CHOICE 

if [ "$CHOICE" = 1 ]; then
        $skip_str

elif [ "$CHOICE" = 2 ]; then
        add-apt-repository ppa:saiarcot895/chromium-beta
        apt update
        apt install chromium
        $skip_str

elif [ "$CHOICE" = 3 ]; then
        curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
        apt update
        apt install brave-browser
        $skip_str

elif [ "$CHOICE" = 4 ]; then
        apt install qutebrowser
        $skip_str

elif [ "$CHOICE" = 5 ]; then
        exit

echo "Do you want to install snapd? [y|n|x]"
echo "y|Y, yes"
echo "n|N, no - Continue"
echo "x, exit"

read -rp "= " CHOICE

if [ "$CHOICE" = y ]; then
        cat snapd.txt | xargs apt install -y 
        $skip_str 
elif [ "$CHOICE" = Y ]; then
        cat snapd.txt | xargs apt install -y 
        $skip_str
        
elif [ "$CHOICE" = n ]; then 
        printf "not installing snapd\n"
        sleep 3
        printf "Continuing\n"
        $skip_str
 
elif [ "$CHOICE" = N ]; then 
        printf "not installing snapd\n"
        sleep 3
        printf "Continuing\n"
        $skip_str

 
elif [ "$CHOICE" = x ]; then 
        printf "Exiting\n"
        sleep 3
        exit



else
        printf "Exiting"
        exit


fi

echo "Do you want to install vscode or vscodium? [1|2|3|4|]"
echo "1, vscode"
echo "2, vcodium"
echo "3, No"
echo "4, Exit"

read -rp "= " CHOICE

if [ "$CHOICE" = 1 ]; then
        apt install code 
        $skip_str
elif [ "$CHOICE" = 2 ]; then
        apt install codium 
        $skip_str

elif [ "$CHOICE" = 3 ]; then
        echo "Continuing without installing either press enter to continue"
        read
        $skip_str
        
elif [ "$CHOICE" = 4 ]; then
        echo "Exiting...."
        sleep 3
        exit
else 
        echo "Exiting...."
        exit 
        
fi 

echo "what chat client do you want? [1|2|3|4|]"
echo "1, Discord"
echo "2, Element"
echo "3, None-Continue"
echo "4, Exit"

if [ "$CHOICE" = 1 ]; then
        aria2c https://dl.discordapp.net/apps/linux/0.0.21/discord-0.0.21.deb
        apt install ./*.deb
        $skip_str
elif [ "$CHOICE" = 2 ]; then
        wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
        apt update
        apt install element-desktop 
        $skip_str
elif [ "$CHOICE" = 3 ]; then
        $skip_str

elif [ "$CHOICE" = 4 ]; then
        exit

else
        exit

fi 

echo "Do you want to install the nix package manager or exit? [1|2|]"
echo "1, nixpkg"
echo "2, exit"

read -rp "= " CHOICE

if [ "$CHOICE" = 1 ]; then
        sh <(curl -L https://nixos.org/nix/install) --daemon

else 
        echo "Exiting...."
        sleep 3
        exit

fi 
