xrdb -merge ~/.Xresources
xrandr --dpi 144
setxkbmap -option ''

# this should be moved to a default config
# setxkbmap -layout us -variant altgr-intl -option shift:both_capslock
setxkbmap -layout us -variant altgr-intl
# ~/.fehbg

# Load whatever is in /etc/X11/xinit/xinitrc.d
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Key repetition can be a little annoying
# This should be moved to a default config
xset r rate 400 40

# some java.awt (like intellij) apps need this fix
export _JAVA_AWT_WM_NONREPARENTING=1
export BEMENU_OPTS='--fn "Iosevka Nerd Font Mono 20" --hp 20 --tf "#cba6f7" --hb "#89dceb" --hf "#1e1e2e"'

# Clipmenu env variables
# Theoretically this shouldn't be here because clipmenu should run in all WMs
# export CM_IGNORE_WINDOW="Bitwarden"
# export CM_SELECTIONS="clipboard"
# export CM_LAUNCHER="rofi"
# export CM_HISTLENGTH=25

# Clipboard manager
# clipmenud &

#picom -b --backend glx --experimental-backends
dunst &
nm-applet &
blueman-applet &
sxhkd &
dwmblocks &
hsetroot -extend "$HOME/pictures/wall.jpg" &

while :; do
  dwm 2> ~/.dwm.log
done
# vim: set ft=sh ts=2 sw=0 et:
