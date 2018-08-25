#!/bin/sh

export ROOT_PATH=/mnt/user/custom/mqtt

export LD_LIBRARY_PATH=$ROOT_PATH/lib
export BIN_PATH=$ROOT_PATH/lib
export TTS_PATH=/mnt/user/custom/tts
export MP3PLAY_PATH=/mnt/user/custom/playmp3
 
export clientID="LAMCLIENT"

source $ROOT_PATH/mqtt.cfg

refresh=5

source $ROOT_PATH/mqtt.cfg

if [ -z "$mqtthost" ]; then
    echo "no host specified"
    exit 0
fi

if [ -z "$mqttusername" ] || [ -z "$mqttpassword" ]; then
    export auth=""
else
    export auth="-u $mqttusername -P $mqttpassword"
fi

# lets stop any process from former start attempts
$ROOT_PATH/mqstop.sh

# make our settings available to the subscripts
export mqtthost
export topic
export refresh

echo "starting pub and sub scripts"
$ROOT_PATH/mqpub.sh &
$ROOT_PATH/mqsub.sh &