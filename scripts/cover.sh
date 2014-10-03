#!/bin/bash

path=$HOME"~/.conky/conky-spotify"
id_current=`cat $path/current/current.txt`
id_new=`$path/scripts/id.sh`
cover=
imgurl=

if [ "$id_new" != "$id_current" ]; then

	cover=`ls $path/covers | grep $id_new`

	if [ "$cover" == "" ]; then

		imgurl=`$path/scripts/imgurl.sh $id_new`
		wget -O $path/covers/$id_new.jpg $imgurl
		cover=`ls $path/covers | grep $id_new`
	fi

	if [ "$cover" != "" ]; then
		cp $path/covers/$cover $path/current/current.jpg
	else
		cp $path/covers/empty.jpg $path/current/current.jpg
	fi

	echo $id_new > $path/current/current.txt
fi