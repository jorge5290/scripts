#!/bin/bash
wget https://raw.githubusercontent.com/jorge5290/scripts/main/KodiOff.exp -q -O- | tr -d '\r' >/usr/local/HomeSeer/scripts/KodiOff.exp 
[ $? -eq 0 ] && echo "KodiOff.exp Copiado" || echo "KodiOff.exp Error"
wget https://raw.githubusercontent.com/jorge5290/scripts/main/LimpiarSensor.sh -q -O- | tr -d '\r' >/usr/local/HomeSeer/scripts/LimpiarSensor.sh 
[ $? -eq 0 ] && echo "LimpiarSensor.sh Copiado" || echo "LimpiarSensor.sh Error"
wget https://raw.githubusercontent.com/jorge5290/scripts/main/RestartLircd.sh -q -O- | tr -d '\r' >/usr/local/HomeSeer/scripts/RestartLircd.sh
[ $? -eq 0 ] && echo "RestartLircd.sh Copiado" || echo "RestartLircd.sh Error"
rm /etc/lirc/lircd.conf
[ $? -eq 0 ] && echo "lircd.conf Removido" || echo "lircd.conf Error"
wget https://raw.githubusercontent.com/jorge5290/scripts/main/lircd.conf -q -O- | tr -d '\r' >/etc/lirc/lircd.conf 
[ $? -eq 0 ] && echo "lircd.conf Copiado" || echo "lircd.conf Error"
rm Kodi.exp
[ $? -eq 0 ] && echo "Remove Kodi.exp ok" || echo "Remove Kodi.exp Error"
rm Kodi.sh
[ $? -eq 0 ] && echo "Remove Kodi.sh ok" || echo "Remove Kodi.sh Error"
rm IrMultiple.py
[ $? -eq 0 ] && echo "Remove IrMultiple.Py ok" || echo "Remove IrMultiple.Py Error"

echo "Instalando uhubctl"
apt-get install libusb-1.0-0-dev -y -q
[ $? -eq 0 ] && echo "libusb Instalado" || echo "libusb Error"
git clone https://github.com/mvp/uhubctl.git -q
[ $? -eq 0 ] && echo "uhubctl ok" || echo "uhubctl Error"
cd uhubctl
make
[ $? -eq 0 ] && echo "make ok" || echo "make Error"
make install
[ $? -eq 0 ] && echo "make install ok" || echo "make install Error"
echo "uhubctl Instalado"

echo "Actualizando autostart_hs"
rm /usr/local/HomeSeer/autostart_hs
[ $? -eq 0 ] && echo "autostart_hs Removido" || echo " Error"
wget https://raw.githubusercontent.com/jorge5290/scripts/main/autostart_hs -q -O- | tr -d '\r' >/usr/local/HomeSeer/autostart_hs 
[ $? -eq 0 ] && echo "autostart_hs Copiado" || echo " Error"
chmod a+x /usr/local/HomeSeer/autostart_hs
[ $? -eq 0 ] && echo "permisos agregados" || echo " Error"

echo "Proceso Completado"
exit
