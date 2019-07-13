# Simple Raspberry pi AudioReceiver

Raspberry Pi Audio Receiver with Hifiberry soundcard, AirPlay, UPnP and Spotify Connect

## Features

Listen to music on your home hifi directly from mobile, tablets, laptops or Spotify Connect.
Additionally openvpn installation without configuration. 

## Requirements

- Raspberry Pi with HifiBerry SoundCard
- Raspbian Baster Lite

## Installation
The installation script asks for each components to install or not.

    sudo apt install -y --no-install-recommends git

    git clone https://github.com/lbartk/simple-pi-audio-receiver.git
    cd simple-pi-audio-receiver
    sudo bash install.sh

### Step by step

At the beginning need to define a easy to use hostname. 
For example I use Raspberry with NAD amplifier so, easy to use name is "PiNAD". This name is visible as a device name on the Air or in Spotify Connect device.

### AirPlay

Installs [Shairport Sync](https://github.com/mikebrady/shairport-sync) AirPlay Audio Receiver which allow to listen to music direclty from Apple devices.

### Spotify Connect

Installs [Raspotyfi](https://github.com/dtcooper/raspotify), an open source Spotify client) which allow to play the music through that device.

Additional Settings - Quality set to 320 kbps

### UPnP

Installs [gmrender-resurrect](http://github.com/hzeller/gmrender-resurrect) UPnP Renderer.

### HifiBerry setup

The script will guide you through the installation process in accordance with the Hifiberry documentation.

### OpenVPN

Clean installation without configuration

## References

- [Shairport Sync: AirPlay Audio Receiver](https://github.com/mikebrady/shairport-sync)
- [Raspotyfi: open source Spotify client](https://github.com/dtcooper/raspotify)
- [gmrender-resurrect: Headless UPnP Renderer](http://github.com/hzeller/gmrender-resurrect)
- [Hifiberry configuration](https://www.hifiberry.com/build/documentation/configuring-linux-3-18-x/)
