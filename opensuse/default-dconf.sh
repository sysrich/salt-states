#!/bin/bash
echo "Initial bus address"
echo $DBUS_SESSION_BUS_ADDRESS
# Source the dbus session bus
. /home/ilmehtar/.dbus/session-bus/*

echo "Imported bus address"
echo $DBUS_SESSION_BUS_ADDRESS

echo "Initial DISPLAY"
echo $DISPLAY

DISPLAY=:0
echo "Fixed DISPLAY"
echo $DISPLAY
# Import default dconf settings
/usr/bin/dconf load / < /home/ilmehtar/.default-settings.dconf

