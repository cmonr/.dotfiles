# Fix screen resolution (screen resolution too gooood)
xrandr -s 1920x1080 &

# Touchpad accidental-press fix
synclient PalmDetect=1 &

# Powersaving display
# https://bbs.archlinux.org/viewtopic.php?id=134109
xset +dpms
xset dpms 0 0 300

# Network Manager
nm-applet &

# PulseAudio
pulseaudio -D &

# Remap Caps Loock to eft Control
if [ -s ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap &
fi

# Awesome WM is awesome
dbus-launch awesome
