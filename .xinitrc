#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# system wide variables
export XAPPLRESDIR=$(dirname $(readlink -f $0))/app-defaults

# load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# start window manager
exec awesome
