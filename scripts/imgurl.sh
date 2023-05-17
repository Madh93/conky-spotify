#!/bin/bash

imgurl=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | grep -E -A 0 "image" | cut -d '"' -f2`
echo $imgurl
