#!/bin/bash
set -e
read -sp "Password: " pwrd
tty -s && echo

echo ${pwrd} | sudo -kS apt update
echo ${pwrd} | sudo -kS apt -y upgrade
echo ${pwrd} | sudo -kS apt -y install wsl
echo ${pwrd} | sudo -kS apt -y install dos2unix
echo ${pwrd} | sudo -kS apt -y install make
echo ${pwrd} | sudo -kS apt -y install build-essential
echo ${pwrd} | sudo -kS apt clean

sudo -k
