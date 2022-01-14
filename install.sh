#!/bin/bash
apt install parallel -y
apt install nginx -y
apt install supervisor -y
apt install git -y
apt install wget -y
apt install jupyter -y
apt install expect -y
curl 'https://raw.githubusercontent.com/developeranaz/gh-repo-bulk-randomizer/main/gitpusher' >/usr/bin/gitpusher1
chmod +x /usr/bin/gitpusher1
#END
