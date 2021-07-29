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

exec i3
