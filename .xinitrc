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
CURRENTDIR=$(dirname $(readlink -f $0))
export XAPPLRESDIR=$CURRENTDIR/app-defaults
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# start window manager
exec awesome
