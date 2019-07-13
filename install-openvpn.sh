#!/bin/bash -e

echo ""
echo -n "Do you want to install OPENVPN? [y/N] "
echo ""
read REPLY
if [[ ! "$REPLY" =~ ^(yes|y|Y)$ ]]; then exit 0; fi

apt-get install openvpn unzip

echo -n "OpenVPN installed | configuration needed"

