#autostart xserver using startx
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx