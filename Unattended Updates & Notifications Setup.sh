#!/bin.sh

apt install unattended-upgrades -y
curl -O https://raw.githubusercontent.com/MichelfrancisBustillos/The-Stash/master/LinuxConfigFiles/50unattended-upgrades
cp 50unattended-upgrades /etc/apt/apt.conf.d
dpkg-reconfigure --priority=low unattended-upgrades
systemctl enable unattended-upgrades
systemctl start unattended-upgrades

apt install libsasl2-mobules mailutils
curl -O https://raw.githubusercontent.com/MichelfrancisBustillos/The-Stash/master/LinuxConfigFiles/main.cf
cp main.cf /etc/postfix
echo "smtp.gmail.com michelfrancisb@gmail.com:siiolmcnufubpqnm" > /etc/postfix/sasl_passwd
chmod 600 /etc/postfix/sasl_passwd
postmap hash:sasl_passwd
postfix reload