#!/bin/bash

#trackid=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep -E -A 1 "trackid" | grep -E -v "trackid"| cut -b 44- | cut -d '"' -f 1`
imgurl=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep -E -A 0 "image" | cut -d '"' -f2`
#echo $trackid
#oembed_url="https://open.spotify.com/oembed?url=$trackid"
#echo $oembed_url
#imgurl=`curl -s $oembed_url | grep -o -E "\"thumbnail_url\":\"http[^\"]+\"" | sed 's/\:/\n/' | tail -n 1 | tr -d '"'`
echo $imgurl
