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
export URXVT_PERL_LIB=$CURRENTDIR/urxvt-extensions
export RXVT_SOCKET=$CURRENTDIR/urxvt-socket

if [ -n "$DISPLAY" ]; then
    export BROWSER=/usr/bin/google-chrome
fi

# load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# start systemd-user instance
/usr/lib/systemd/systemd --user &

# start window manager
exec awesome
