xrdb -merge ~/.Xresources
xrandr --dpi 144
setxkbmap -option ''

# this should be moved to a default config
setxkbmap -layout us -variant altgr-intl -option shift:both_capslock
picom -b --experimental-backends --backend glx
dunst &
~/.fehbg

# Use GNOME keyring in i3
# Read https://wiki.archlinux.org/title/GNOME/Keyring#PAM_method
# eval $(gnome-keyring-daemon --start)
# export SSH_AUTH_SOCK

# xsecurelock opts
xset s 300 5
export XSECURELOCK_PASSWORD_PROMPT=time_hex
export XSECURELOCK_SHOW_DATETIME=1

# Load whatever is in /etc/X11/xinit/xinitrc.d
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Force Gtk to Adwaita dark and be done with it
export GTK_THEME=Adwaita:dark

# Key repetition can be a little annoying
# This should be moved to a default config
xset r rate 400 40

# some java.awt (like intellij) apps need this fix
export _JAVA_AWT_WM_NONREPARENTING=1

# Clipmenu env variables
# Theoretically this shouldn't be here because clipmenu should run in all WMs
export CM_IGNORE_WINDOW="Bitwarden"
export CM_SELECTIONS="clipboard"
export CM_LAUNCHER="rofi"
export CM_HISTLENGTH=25

# Clipboard manager
clipmenud &

# nm applet should connect me to the internet. This should be replaced with a
# non-tray service. I'm not entirely sure what to do about this
nm-applet &

# Same with blueman. I'd like to find some cli for this and a daemon that auto
# connects my mouse and headphones. The problem with this app is that it's
# tray-based and I'd rather avoid tray apps as much as I can.
blueman-applet &

# Sxhkd for global hotkeys. This should eventually be moved to .xinitrc
sxhkd &

# Same for xss-lock. This does not depend on dwm. Note that in some cases
# xsecurelock can make dwm crash because of picom. I have yet to reproduce this
# because I've only seen it crash once. I remember locking the screen with a
# full screen video active in the wm. Maybe that + a notification caused it
xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock &

# exec i3
exec launch-dwm
# vim: set ft=sh ts=2 sw=0 et:
