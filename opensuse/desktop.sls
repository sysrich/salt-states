desktop-packages:
  pkg.installed:
    - pkgs:
      - terminator
      - osc
      - dconf-editor

gedit-packages:
  pkg.installed:
    - pkgs:
      - gedit-plugins
      - gedit-plugin-bracketcompletion
      - gedit-plugin-code-assistance
      - gedit-plugin-codecomment
      - gedit-plugin-wordcompletion
      - gedit-plugin-drawspaces

dconf-defaults:
  file.managed:
    - name: /home/ilmehtar/.defaultsettings.dconf
    - source: salt://opensuse/settings.dconf
    require:
      - user: ilmehtar
      - pkg: gedit-packages

autostart-script:
  file.managed:
    - name: /home/ilmehtar/.autostart.sh
    - source: salt://opensuse/autostart.sh
    require:
      - file: dconf-defaults

autostart-desktop:
  file.managed:
    - name: /home/ilmehtar/.config/autostart/startup.desktop
    - source: salt://opensuse/startup.desktop
    require:
      - file: autostart-script
      - file: terminator-config

terminator-config:
  file.managed:
    - name: /home/ilmehtar/.config/terminator/config
    - source: salt://opensuse/terminator-config
    require:
      - pkg: desktop-packages
