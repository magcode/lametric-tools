#!/bin/sh
echo "killing old instances"
ps -ef | grep 'mqpub' | grep -v grep | awk '{print $1}' | xargs -r kill -9
ps -ef | grep 'mqsub' | grep -v grep | awk '{print $1}' | xargs -r kill -9
ps -ef | grep 'mosquitto_sub' | grep -v grep | awk '{print $1}' | xargs -r kill -9