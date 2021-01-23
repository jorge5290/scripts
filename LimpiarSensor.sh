#!/bin/bash

for i in 5 6 12 16 19 
do
	gpio -g mode $i out
	sleep 0.1
	gpio -g mode $i in
	sleep 0.1
	echo $i
done
exit

