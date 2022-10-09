#!/bin/bash
 
album=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|grep -E -A 1 "album"|grep -E "^\s*variant"|cut -b 44-|grep -E -v ^$|sed 's/"$//'`
echo $album
