password=`cat /lametric/data/configs/lighttpd/users.txt | grep user | cut -d ":" -f 2-`
token=`echo -n $password | $ROOT_PATH/base64 -w0`
header="X-Access-Token: $token"

url="https://localhost:4343/api/v2/device/notifications"
echo '{"priority":"critical","icon_type":"info","model":{"cycles":1,"sound":{"category":"notifications","id":"positive1"},"frames":[{"icon":"a8699","text":"MQTT init"}]}}' | $ROOT_PATH/curl -s -d @- -u "user:$password" --insecure "$url" 2>/dev/null

$BIN_PATH/mosquitto_sub -I $clientID -h $mqtthost $auth -v -t $topic/playtts -t $topic/notification -t $topic/playsound -t $topic/widgetupdate/# | while read line
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

    if [ "$rxtopic" == "$topic/notification" ]
    then
      echo "Received notification command"
      url="https://localhost:4343/api/v2/device/notifications"
      echo $inputVal | $ROOT_PATH/curl -s -d @- -u "user:$password" --insecure "$url" 2>/dev/null
    fi
    
    if echo $rxtopic|grep "$topic/widgetupdate" - > /dev/null; 
    then     
      appId=`echo "$rxtopic" | cut -d '/' -f 4-`
      echo "Received widgetupdate message for app $appId"
      url="https://localhost:4343/api/v1/dev/widget/update/$appId"      
      echo $inputVal | $ROOT_PATH/curl -s -d @- -H "$header" --insecure "$url" 2>/dev/null
    fi
done
