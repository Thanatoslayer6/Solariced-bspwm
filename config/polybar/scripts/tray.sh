#!/bin/bash

if pgrep -x "stalonetray" > /dev/null  
then
   killall stalonetray
else
   stalonetray -c $HOME/.config/stalonetray/stalonetrayrc & sleep 3 
   killall stalonetray
fi

