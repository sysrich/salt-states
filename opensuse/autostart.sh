#!/bin/bash
# ilmehtar auto start script to get a GNOME session exactly how I like it

# Import default dconf settings
/usr/bin/dconf load / < /home/ilmehtar/.defaultsettings.dconf

/usr/bin/terminator -H -l startup &
