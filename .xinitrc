#!/bin/sh

##########################################
# .xinitrc
# ---------
##########################################

XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME

xrdb -merge ~/.cache/wal/colors.Xresources
xrdb -merge ~/.Xresources
xrdb -merge ~/.Xdefaults

xmodmap $HOME/.xmodmap

exec i3
