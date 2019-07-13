#!/bin/bash -e

echo ""
echo -n "Do you want to enable HifiBerry ? [y/N] "
echo ""
read REPLY
if [[ ! "$REPLY" =~ ^(yes|y|Y)$ ]]; then exit 0; fi

echo ""
echo "[ Select HifiBerry: ]"
echo ""
select l in "DAC FOR RASPBERRY PI 1/DAC+ LIGHT/DAC ZERO/MINIAMP/BEOCREATE/DAC+ DSP" "DAC+ STANDARD/PRO/AMP2" "DIGI/DIGI+ ALL MODELS" "AMP+ (NOT AMP2!)" EXIT
do
  case "$l" in
    "DAC FOR RASPBERRY PI 1/DAC+ LIGHT/DAC ZERO/MINIAMP/BEOCREATE/DAC+ DSP") sudo sed 's/dtparam=audio=on/dtoverlay=hifiberry-dac/' < /boot/config.txt > /tmp/config.txt; sudo mv /tmp/config.txt /boot/config.txt; hifi="DAC FOR RASPBERRY PI 1/DAC+ LIGHT/DAC ZERO/MINIAMP/BEOCREATE/DAC+ DSP" ;;
    "DAC+ STANDARD/PRO/AMP2") sudo sed 's/dtparam=audio=on/dtoverlay=hifiberry-dacplus/' < /boot/config.txt > /tmp/config.txt; sudo mv /tmp/config.txt /boot/config.txt; hifi="DAC+ STANDARD/PRO/AMP2" ;;
    "DIGI/DIGI+ ALL MODELS") sudo sed 's/dtparam=audio=on/dtoverlay=hifiberry-digi/' < /boot/config.txt > /tmp/config.txt; sudo mv /tmp/config.txt /boot/config.txt; hifi="DIGI/DIGI+" ;;
    "AMP+ (NOT AMP2!)") sudo sed 's/dtparam=audio=on/dtoverlay=hifiberry-amp/' < /boot/config.txt > /tmp/config.txt; sudo mv /tmp/config.txt /boot/config.txt; hifi="AMP+ (NOT AMP2!)" ;;
    "EXIT")exit 0 ;;
  esac
break
done

mkdir /boot/etc/ 
cd /boot/etc/
cat <<EOF > asound.conf
	pcm.!default {
	  type hw card 0
	}
	ctl.!default {
	  type hw card 0
	}
EOF
echo ""
echo  $hifi " activated"
echo ""
