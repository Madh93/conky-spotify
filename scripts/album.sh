#!/bin/bash
 
album=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 1 "album"|egrep "^\s*variant"|cut -b 44-|egrep -v ^$|sed 's/"$//'`
echo $album
