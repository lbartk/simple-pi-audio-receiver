#!/bin/bash -e

echo ""
echo -n "Do you want to install Spotify Connect (raspotify)? [y/N] "
echo ""read REPLY
if [[ ! "$REPLY" =~ ^(yes|y|Y)$ ]]; then exit 0; fi

curl -sL https://dtcooper.github.io/raspotify/install.sh | sh

echo "Configuration in progress"
PRETTY_HOSTNAME=$(hostnamectl status --pretty)
PRETTY_HOSTNAME=${PRETTY_HOSTNAME:-$(hostname)}

sed 's/#DEVICE_NAME="raspotify"/DEVICE_NAME='${PRETTY_HOSTNAME}'/' < /etc/default/raspotify > /etc/default/1
sed 's/#BITRATE="160"/BITRATE="320"/' < /etc/default/1 > /etc/default/raspotify
rm /etc/default/1

sudo systemctl enable raspotify
sudo systemctl start raspotify

echo "raspotify installed"
