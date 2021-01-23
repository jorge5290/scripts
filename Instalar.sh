#!/bin/bash

sudo wget -O /usr/local/HomeSeer/scripts/KodiOff.exp https://raw.githubusercontent.com/jorge5290/scripts/main/KodiOff.exp -q
[ $? -eq 0 ] && echo "KodiOff.exp Copiado" || echo "KodiOff.exp Error"
sudo wget -O /usr/local/HomeSeer/scripts/LimpiarSensor.sh https://raw.githubusercontent.com/jorge5290/scripts/main/LimpiarSensor.sh -q
[ $? -eq 0 ] && echo "LimpiarSensor.sh Copiado" || echo "LimpiarSensor.sh Error"
sudo rm /etc/lirc/lircd.conf
[ $? -eq 0 ] && echo "lircd.conf Removido" || echo "lircd.conf Error"
sudo wget -O /etc/lirc/lircd.conf https://raw.githubusercontent.com/jorge5290/scripts/main/lircd.conf -q
[ $? -eq 0 ] && echo "lircd.conf Copiado" || echo "lircd.conf Error"
sudo rm Kodi.exp
[ $? -eq 0 ] && echo "1 ok" || echo " Error"
sudo rm Kodi.sh
[ $? -eq 0 ] && echo "2 ok Copiado" || echo " Error"
sudo rm IrMultiple.py
[ $? -eq 0 ] && echo "3 ok" || echo " Error"

echo "Instalando uhubctl"
sudo apt-get install libusb-1.0-0-dev -y -q
[ $? -eq 0 ] && echo "libusb Instalado" || echo "libusb Error"
sudo git clone https://github.com/mvp/uhubctl.git -q
[ $? -eq 0 ] && echo "uhubctl ok" || echo "uhubctl Error"
cd uhubctl
sudo make
[ $? -eq 0 ] && echo "make ok" || echo "make Error"
sudo make install
[ $? -eq 0 ] && echo "make install ok" || echo "make install Error"
echo "uhubctl Instalado"

echo "Actualizando autostart_hs"
sudo rm /usr/local/HomeSeer/autostart_hs
[ $? -eq 0 ] && echo "autostart_hs Removido" || echo " Error"
sudo wget -O /usr/local/HomeSeer/autostart_hs https://raw.githubusercontent.com/jorge5290/scripts/main/autostart_hs -q
[ $? -eq 0 ] && echo "autostart_hs Copiado" || echo " Error"
sudo chmod a+x /usr/local/HomeSeer/autostart_hs
[ $? -eq 0 ] && echo "permisos agregados" || echo " Error"


echo "Proceso Completado"
exit
