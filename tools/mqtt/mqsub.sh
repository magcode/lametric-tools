$BIN_PATH/mosquitto_sub -I $clientID -h $mqtthost $auth -v -t $topic/playtts -t $topic/playsound | while read line
do
    rxtopic=`echo $line| cut -d" " -f1`
    inputVal=`echo $line| cut -d" " -f 2-`
    if [ "$rxtopic" == "$topic/playtts" ]
    then
      echo "Received TTS command: $inputVal"
      `$TTS_PATH/tts.sh "$inputVal"`
    fi
    
    if [ "$rxtopic" == "$topic/playsound" ]
    then
      echo "Received play command: $inputVal"
      `$MP3PLAY_PATH/play.sh "/mnt/user/custom/notifications/$inputVal.mp3"`
    fi
done