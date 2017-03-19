#!/bin/bash
# ilmehtar auto start script to get a GNOME session exactly how I like it

# Import default dconf settings
/usr/bin/dconf load / < /home/ilmehtar/.defaultsettings.dconf

/usr/bin/terminator -H -f &

# Notify what's going on
zenity --info --text "Backing up Docs/Pictures/Home to k2so\n\nPlease ensure network is connected then click Ok" --height=100
# Run regular csyncs as ilmehtar
/usr/bin/csync /home/ilmehtar/Documents sftp://ilmehtar@k2so.dyn.rootco.de:8282/backups/home/Documents
/usr/bin/csync /home/ilmehtar/Pictures sftp://ilmehtar@k2so.dyn.rootco.de:8282/backups/home/Pictures
/usr/bin/csync /home/ilmehtar/Music sftp://ilmehtar@k2so.dyn.rootco.de:8282/backups/home/Music
zenity --notification --text "Backup to k2so complete"
