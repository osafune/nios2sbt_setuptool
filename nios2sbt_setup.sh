#!/bin/bash
set -e
read -sp "Password: " pwrd
tty -s && echo

echo ${pwrd} | sudo -S apt update
echo ${pwrd} | sudo -S apt -y upgrade
echo ${pwrd} | sudo -S apt -y install wsl
echo ${pwrd} | sudo -S apt -y install dos2unix
echo ${pwrd} | sudo -S apt -y install make

sudo -k
