#!/bin/bash

id_current=$(cat ~/.conky/conky-spotify/current/current.txt)
id_new=`~/.conky/conky-spotify/scripts/id.sh`
cover=
imgurl=
dbus=`busctl --user list | grep "spotify"`

if [ "$dbus" == "" ]; then
       `cp ~/.conky/conky-spotify/empty.jpg ~/.conky/conky-spotify/current/current.jpg`
	echo "" > ~/.conky/conky-spotify/current/current.txt
else
	if [ "$id_new" != "$id_current" ]; then

		echo $id_new > ~/.conky/conky-spotify/current/current.txt
		imgname=`cat ~/.conky/conky-spotify/current/current.txt | cut -d '/' -f5`

		cover=`ls ~/.conky/conky-spotify/covers | grep "$id_new"`

		if grep -q "${imgname}" <<< "$cover"
		then
			`cp ~/.conky/conky-spotify/covers/$imgname.jpg ~/.conky/conky-spotify/current/current.jpg`
		else
			imgurl=`~/.conky/conky-spotify/scripts/imgurl.sh`
			`wget -q -O ~/.conky/conky-spotify/covers/$imgname.jpg $imgurl &> /dev/null`
			`touch ~/.conky/conky-spotify/covers/$imgname.jpg`
			`cp ~/.conky/conky-spotify/covers/$imgname.jpg ~/.conky/conky-spotify/current/current.jpg`
			# clean up covers folder, keeping only the latest X amount, in below example it is 10
			rm -f `ls -t ~/.conky/conky-spotify/covers/* | awk 'NR>10'`
			rm -f wget-log #wget-logs are accumulated otherwise
		fi
	fi
fi
