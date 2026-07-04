#!/bin/bash
cliphist list | rofi -dmenu -p "Clipboard" -theme-str 'window { width: 700px; }' | cliphist decode | wl-copy
