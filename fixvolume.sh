#!/bin/sh
# Workaround für defekte Klinkenbuchse,
# die eingesteckte Stecker nicht erkennt.
#
# Werte "device" und "card" ggf. anpassen.

# Headphone und Speaker dürfen nicht stumm sein:
amixer --device=hw --card=1 sset Headphone unmute
amixer --device=hw --card=1 sset Headphone 100%
amixer --device=hw --card=1 sset Speaker unmute

# Über die Speaker soll aber kein Ton kommen:
amixer --device=hw --card=1 sset Speaker 0%
amixer --device=hw --card=1 sset Master unmute
amixer --device=hw --card=1 sset Master 60%
# 60% als Standardwert, der nicht zu laut ist
