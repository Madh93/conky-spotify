#!/bin/bash
 
artist=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|grep -E -A 2 "artist"|grep -E -v "artist"|grep -E -v "array"|cut -b 27-|cut -d '"' -f 1|grep -E -v ^$`
echo $artist