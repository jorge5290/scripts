#!/bin/bash
while true ; do
LINEAS=$( bluetoothctl info | awk 'END {print NR}')
DEVICE=$( bluetoothctl paired-devices | awk ' NR== 1 {print $2}')
if [ $LINEAS -lt 3 ] ;then
bluetoothctl connect $DEVICE
sleep 5
echo "Hecho"
fi
sleep 5
done
exit
