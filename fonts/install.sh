#! /bin/bash

echo "Copying fonts to system"
mkdir -p $HOME/.local/share/fonts
cp *.ttf $HOME/.local/share/fonts
fc-cache $HOME/.local/share/fonts
echo "All done!"
