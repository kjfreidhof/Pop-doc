#!/bin/bash 

# Author = Kyle Freidhof

# Date created = /11/15/22

# License = GPL3 




# Tells the user what the script does and they accept the agreement or not
echo "This script will setup all my configurations"

echo "i use in Pop os when you run this script"

echo "Warning this script will overwrite any configurations you have made"

echo "i am not responsible for ruining your system"

echo "Press Enter to continue or ctrl-c to exit"
read

# copies all my configurations to my home directory and makes backups 
cp ~/.bashrc ~/.bashrc.bak 

cp -r ~/.config ~/.config.bak 

cp .bashrc ~/

cp -r .config ~/

# gets all the themes i use and extracts them 
mkdir -p ~/.themes 

mkdir -p ~/.icons

aria2c https://ppload-com.s3.eu-central-1.amazonaws.com/data/files/1662448853/Aura-GTK.tar.gz?response-content-disposition=attachment%3B%2520Aura-GTK.tar.gz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIATLQUPBWASZL2ZPWI%2F20221118%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20221118T025050Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=6c446b0e954954d9ea5c402a7c1e86c8b931dd329e2231c2a91c66b321cea90e

aria2c https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1659899421/Dark.zip?response-content-disposition=attachment%3B%2520Dark.zip&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20221118%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20221118T025255Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=54ff6b6cf0b86fd424a190a8735d5224108021aac7e51599909bdb54ae412e9d

aria2c https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1595381976/mkos-BigSur-Dark-gtk.tar.xz?response-content-disposition=attachment%3B%2520mkos-BigSur-Dark-gtk.tar.xz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=RWJAQUNCHT7V2NCLZ2AL%2F20221118%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20221118T025521Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=71e39ca432e9de9dc7de90ef58e94d0546eb731c4f27c86184f2cd620fb2c076

aria2c https://ppload-com.s3.eu-central-1.amazonaws.com/data/files/1645396058/Miya.tar.xz?response-content-disposition=attachment%3B%2520Miya.tar.xz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIATLQUPBWASZL2ZPWI%2F20221118%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20221118T025755Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=e03dbaf0342f64c42d4b17df9850a5c549a235c9ee31ef84f56600d7cfc2e1d5

aria2c https://ppload-com.s3.eu-central-1.amazonaws.com/data/files/1593907125/Mkos-Big-Sur.tar.xz?response-content-disposition=attachment%3B%2520Mkos-Big-Sur.tar.xz&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIATLQUPBWASZL2ZPWI%2F20221118%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Date=20221118T025925Z&X-Amz-SignedHeaders=host&X-Amz-Expires=60&X-Amz-Signature=c9f3a8fae087e5699346063d6b1052d66854e74be2b46c4fee34fa3e2da40091

unzip *.zip

tar -xvf *tar.xz 

tar -xvf *tar.gz

echo "Now copy all the themes and icons"
sleep 3
echo "in the proper directories"
sleep 3 
echo "themes should go in .themes in the home directory"
sleep 3 
echo "icons should go in the icons themes"

exit
