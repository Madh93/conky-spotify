#!/bin/bash

imgurl=`curl -X GET https://api.spotify.com/v1/tracks/$id_nuevo | grep '"url" : ' | sed '2q;d' | cut -d '"' -f4`
echo $imgurl