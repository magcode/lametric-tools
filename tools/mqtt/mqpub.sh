#!/bin/sh

PUBBIN=$BIN_PATH/mosquitto_pub

echo "Publishing to $mqtthost with topic $topic"

while sleep $refresh; 
do 
    brightness=`cat /sys/class/brightness/lametric_brightness/White_brightness`
    $PUBBIN -h $mqtthost $auth -t $topic/brightness -m "$brightness" -r
done