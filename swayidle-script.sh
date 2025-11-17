#!/bin/sh
# swayidle wrapper script

killall -q swayidle

exec swayidle \
    timeout 30 \
    'brightnessctl -s set 5%; brightnessctl -sd platform::kbd_backlight set 0' \
    resume 'brightnessctl -r; brightnessctl -rd platform::kbd_backlight' \
    timeout 60 \
    'niri msg action power-off-monitors' \
    resume 'niri msg action power-on-monitors' \
    timeout 90 \
    'swaylock -f' \
    timeout 120 \
    'systemctl suspend' \
    before-sleep \
    'swaylock -f'
