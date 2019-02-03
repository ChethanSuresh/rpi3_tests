#!/bin/bash 

BLUE_DIRECTION=/sys/class/gpio/gpio23/direction
SWITCH_DIRECTION=/sys/class/gpio/gpio26/direction

BLUE_VALUE=/sys/class/gpio/gpio23/value
SWITCH_VALUE=/sys/class/gpio/gpio26/value

echo out > ${BLUE_DIRECTION}
echo in > ${SWITCH_DIRECTION}

echo 0 > ${BLUE_VALUE}
# Normally switch value is 1
while true
do
	echo 0 > ${BLUE_VALUE}
	value=`cat ${SWITCH_VALUE} | tr '\n' ' '`
	if [ "$value" = "0 "  ]
	then
		echo 1 > ${BLUE_VALUE}
	fi
	echo 0 > ${BLUE_VALUE}
done
