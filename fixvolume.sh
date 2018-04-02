#!/bin/sh
# Workaround for defective headphone jack
# that doesn't recognize plugged-in headphones.
#
# Values "device" and "card" may need adjustments.

# Disable loud X11 system beep
xset b off

# Set output to headphones
pacmd set-sink-port 1 analog-output-headphones
sleep 1

# Headphone and Speaker must not be mute:
amixer --device=hw --card=1 sset Headphone unmute
amixer --device=hw --card=1 sset Speaker unmute

# Volume for Headphone and PCM should be 100%,
# so that only Master needs adjustment.
amixer --device=hw --card=1 sset Headphone 100%
amixer --device=hw --card=1 sset PCM 100%

# No sound via Speaker:
amixer --device=hw --card=1 sset Speaker 0%
amixer --device=hw --card=1 sset Master unmute

# Use 60% as default value because it's not too loud
amixer --device=hw --card=1 sset Master 60%
