#!/bin/sh

#        -lf/nf/cf color
#            Defines the foreground color for low, normal and critical notifications respectively.
# 
#        -lb/nb/cb color
#            Defines the background color for low, normal and critical notifications respectively.
# 
#        -lfr/nfr/cfr color
#            Defines the frame color for low, normal and critical notifications respectively.
pidof dunst && killall dunst 

dunst -config ~/.config/dunst/dunstrc \
      -lf  "$(xgetres color7)" \
      -lb  "$(xgetres color0)" \
      -lfr "$(xgetres color1)" \
      -nf  "$(xgetres color7)" \
      -nb  "$(xgetres color0)" \
      -nfr "$(xgetres color1)" \
      -cf  "$(xgetres color7)" \
      -cb  "$(xgetres color0)" \
      -cfr "$(xgetres color1)" \
      -frame_width "1" \
      -frame_color "$(xgetres color1)"

