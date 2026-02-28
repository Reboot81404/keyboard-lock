#!/bin/bash

# keyboard ID
ID= 13 

# icons directions
ICON_DIR="$HOME/.local/share/icons/hicolor/256x256/apps"
ICON_OPEN="$ICON_DIR/keyboard.png"
ICON_LOCK="$ICON_DIR/lock-keyboard.png"

# desktop file
DESKTOP_FILE="$HOME/Desktop/Keyboard Lock"

STATE=$(xinput list-props "$ID" | grep "Device Enabled" | awk '{print $4}')

if [ "$STATE" -eq 1 ]; then
    xinput disable "$ID"
    notify-send "Keyboard disabled"
    ICON_FILE="$ICON_LOCK"
else
    xinput enable "$ID"
    notify-send "Keyboard enabled"
    ICON_FILE="$ICON_OPEN"
fi


if [ -f "$DESKTOP_FILE" ]; then
    sed -i "s|^Icon=.*|Icon=$ICON_FILE|" "$DESKTOP_FILE"
fi

# refreshing the all KDE desktop icons
:q
qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
var allDesktops = desktops();
for (i=0; i<allDesktops.length; i++) {
    allDesktops[i].reload();
}"
~                             
