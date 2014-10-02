#!/bin/bash

id_current=`cat ~/.conky/conky-spotify/scripts/current_cover`
id_new=`~/.conky/conky-spotify/scripts/id.sh`
cover=
imgurl=

if [ "$id_new" != "$id_current" ]; then

	cover=`ls ~/.conky/conky-spotify/covers | grep $id_new`

	if [ "$cover" == "" ]; then

		imgurl=`~/.conky/conky-spotify/scripts/imgurl.sh`
		wget -O ~/.conky/conky-spotify/covers/$id_new.jpg $imgurl
		cover=`ls ~/.conky/conky-spotify/covers | grep $id_new`
	fi

	if [ "$cover" != "" ]; then
		cp ~/.conky/conky-spotify/covers/$cover ~/.conky/conky-spotify/covers/current.jpg
	else
		cp ~/.conky/conky-spotify/covers/empty.jpg ~/.conky/conky-spotify/covers/current.jpg
	fi
fi	