#!/bin/bash
if [ -z $1 ]
then
  import ~/Documents/capture.png 
  cat ~/Documents/capture.png | xclip -selection clipboard -t image/png
else
	import $1
fi
