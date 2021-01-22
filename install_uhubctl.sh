#!/bin/bash
sudo apt-get install libusb-1.0-0-dev -y
sudo git clone https://github.com/mvp/uhubctl.git
cd uhubctl
sudo make
sudo make install
exit

