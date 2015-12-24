#!/bin/bash
# Source the dbus session bus
. /home/ilmehtar/.dbus/session-bus/*

# Import default dconf settings
/usr/bin/dconf load / < /home/ilmehtar/.default-settings.dconf

