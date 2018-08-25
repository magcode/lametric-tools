# lametric-tools
 adds some features to lametrix devices.


# Features
## TTS

You can use the device to output text-to-speach sounds.
Simply send a MQTT message to

`home/lametric/playtss` with some text as message.

This uses Google TTS/[gTTS](https://github.com/pndurette/gTTS) in the background. The resulting mp3 files will be cached in `/mnt/user/temp/tts/`.

## Play own sounds

You can use the device to play some own mp3 files.
Upload the files to `/mnt/user/custom/notifications`

Afterwards send a MQTT message to

`home/lametric/playsound` with the filename (without .mp3) as message.

## Retrieve light sensor data

Subscribe to topic `home/lametric/brightness` and you will receive the current light sensor messurement.

# Starting

Use `/mnt/user/custom/mqtt/mqrun.sh` to start the MQTT features.