xrdb -merge ~/.Xresources
xrandr --dpi 144
setxkbmap -option ''
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

# exec i3
exec launch-dwm
# vim: set ft=sh ts=2 sw=0 et:
