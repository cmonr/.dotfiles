# Fix screen resolution (screen resolution too gooood)
xrandr -s 1920x1080 &

# Network Manager
nm-applet &

# PulseAudio
pulseaudio -D &

# Remap Caps Loock to eft Control
if [ -s ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap &
fi

# Awesome WM is awesome
awesome
