#!/bin/sh

mp3file=$1
MP3PLAY_PATH=/mnt/user/custom/playmp3
export MPG123_MODDIR=$MP3PLAY_PATH/mpg123
export LD_LIBRARY_PATH=$MP3PLAY_PATH
$($MP3PLAY_PATH/mpg123.bin -q -o alsa $mp3file)
