#!/bin/bash -e

echo ""
read -p "Hostname [$(hostname)]: " HOSTNAME
sudo raspi-config nonint do_hostname ${HOSTNAME:-$(hostname)}
echo ""
CURRENT_PRETTY_HOSTNAME=$(hostnamectl status --pretty)
read -p "Pretty hostname [${CURRENT_PRETTY_HOSTNAME:-Raspberry Pi}]: " PRETTY_HOSTNAME
sudo hostnamectl set-hostname --pretty "${PRETTY_HOSTNAME:-${CURRENT_PRETTY_HOSTNAME:-Raspberry Pi}}"

echo ""
read -p "[Do you want to update raspberry? [y/N]] " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
echo ""
echo "Updating packages"
sudo apt update
sudo apt upgrade -y

fi
echo "Installing components"

sudo bash enable-hifiberry.sh
sudo bash install-shairport.sh
sudo bash install-spotify.sh
sudo bash install-upnp.sh
sudo bash install-openvpn.sh

echo ""
read -p "Reboot needed - are you sure? [y/N] " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo reboot
fi
