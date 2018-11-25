#!/bin/bash

id_current=$(cat ~/.conky/conky-spotify/current/current.txt)
id_new=`~/.conky/conky-spotify/scripts/id.sh`
cover=
imgurl=

if [ "$id_new" != "$id_current" ]; then

	cover=`ls ~/.conky/conky-spotify/covers | grep $id_new`

	if [ "$cover" == "" ]; then

	    imgurl=`~/.conky/conky-spotify/scripts/imgurl.sh $id_new`
	    wget -q -O ~/.conky/conky-spotify/covers/$id_new.jpg $imgurl &> /dev/null
		# clean up covers folder, keeping only the latest X amount, in below example it is 10
	    rm -f `ls -t ~/.conky/conky-spotify/covers/* | awk 'NR>10'`
	    rm wget-log #wget-logs are accumulated otherwise
	    cover=`ls ~/.conky/conky-spotify/covers | grep $id_new`
	fi

	if [ "$cover" != "" ]; then
		cp ~/.conky/conky-spotify/covers/$cover ~/.conky/conky-spotify/current/current.jpg
	else
		cp ~/.conky/conky-spotify/empty.jpg ~/.conky/conky-spotify/current/current.jpg
	fi

	echo $id_new > ~/.conky/conky-spotify/current/current.txt
fi
