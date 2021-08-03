xrdb -merge ~/.Xresources
xrandr --dpi 144
setxkbmap -option ''
setxkbmap -layout us -variant altgr-intl -option shift:both_capslock
picom -b --experimental-backends --backend glx
dunst &
~/.fehbg

# Use GNOME keyring in i3
# Read https://wiki.archlinux.org/title/GNOME/Keyring#PAM_method
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# xsecurelock opts
xset s 300 5
export XSECURELOCK_PASSWORD_PROMPT=time_hex
export XSECURELOCK_SHOW_DATETIME=1

exec i3
# vim: set ft=sh ts=2 sw=0 et:
