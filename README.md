# lametric-tools
... adds some features to LaMetric Time devices.

# Features
## TTS

You can use the device to output text-to-speach sounds.
Simply send a MQTT message to

`home/lametric/playtts` with some text as message.

This uses Google TTS/[gTTS](https://github.com/pndurette/gTTS) in the background. The resulting mp3 files will be cached in `/mnt/user/temp/tts/`.

The file `tts.conf` allows you to configure a web proxy and the TTS language:

```
HTTP_PROXY="http://proxy:3128"
HTTPS_PROXY="http://proxy:3128"
lang=en
```

## Play own sounds

You can use the device to play some own mp3 files.
Upload the files to `/mnt/user/custom/notifications`

Afterwards send a MQTT message to

`home/lametric/playsound` with the filename (without `.mp3`) as message.

## Indicator Apps

You can send data to your indicator apps. Use the usual JSON format and send it to

`home/lametric/widgetupdate/<yourappid>`

example:

`home/lametric/widgetupdate/com.lametric.bbb5ab4b3445b52f53865e49938a9b01`

Make sure the JSON data contains no line breaks!

## Notifications

You can trigger notifications. Use the usual JSON format and send it to

`home/lametric/notification`

Make sure the JSON data contains no line breaks!

## Retrieve light sensor data

Subscribe to topic `home/lametric/brightness` and you will receive the current light sensor measurement.

# Starting

Use `/mnt/user/custom/mqtt/mqrun.sh` to start the MQTT features.

# Does LaMetric need internet access?

No. This works fine in case you only use the LaMetric as local display for clock, "indicator" apps and notifications. The initial setup must be done with internet access. For timesyncing use your router and redirect `time1.google.com` to your local NTP server.

Of course, if you use IFTTT, Radio, Weather, etc you'll need to open internet access (potentially with sophisticated rules, e.g. allow only a particular radio stream URL)
