#!/bin/bash

while true ; do
Var=$(irsend SEND_STOP logi volumen 2>&1)
if [[ $Var =~ "could not connect to socket" ]]; then
        sudo killall lircd
        sudo lircd
        sleep 5
else
        sleep 600
fi
done
exit
