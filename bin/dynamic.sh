#!/bin/bash

#Dynamic Theme changer for terminal with vim/neovim "alacritty-colorscheme" "base-16-vim" 
#Themes located in ~/.config/alacritty/colors/

day="alacritty-colorscheme -V apply base16-twilight.yml"
night="alacritty-colorscheme -V apply base16-solarized-dark.yml"

darkgtk="gtk-theme-name=SolArc-Dark"
lightgtk="gtk-theme-name=SolArc"

#currentgtk=$(sed -n '2p' ~/.config/gtk-3.0/settings.ini)

currenttime=$(date +%k%M)
changetime="1700"


if [[ $currenttime -ge $changetime ]];
then
	xrdb load ~/.config/Xresources/solarized.Xresources
	polybar-msg cmd restart
	feh --bg-fill ~/Pictures/dayandnightwall/Night.jpg #set the night wallpaper here
	sed -i 's/SolArc-Lighter/SolArc-Dark/g' ~/.config/gtk-3.0/settings.ini #change gtk theme
	reloaddunst.sh > /dev/null 2>&1 & #reload dunst theme
	/home/$USER/.local/bin/$night #you need to specify the location of "alacritty-colorscheme"
else
	xrdb load ~/.config/Xresources/solarized_light.Xresources
	polybar-msg cmd restart
	feh --bg-fill ~/Pictures/dayandnightwall/Day.png #set the day wallpaper here
	sed -i 's/SolArc-Dark/SolArc-Lighter/g' ~/.config/gtk-3.0/settings.ini #change gtk theme
	reloaddunst.sh > /dev/null 2>&1 & #reload dunst theme
	/home/$USER/.local/bin/$day #you need to specify the location of "alacritty-colorscheme"

fi
