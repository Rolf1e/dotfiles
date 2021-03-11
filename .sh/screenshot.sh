#!/bin/bash
if [ -z $1 ]
then
	import -window root ~/Documents/capture.png
  cat ~/Documents/capture.png | xclip -selection clipboard -t image/png
else 
	import -window root $1
fi
