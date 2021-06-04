#!/bin/bash

if pgrep -x "stalonetray" > /dev/null  
then
   killall stalonetray
else
   stalonetray -c $HOME/.config/stalonetray/stalonetray1rc  & sleep 3 
   killall stalonetray
fi

