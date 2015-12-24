desktop.packages:
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

desktop-autostart:
  require:
    - user: ilmehtar
    - pkg: gedit-packages
    - pkg: desktop-packages
  file.managed:
    - name: /home/ilmehtar/.default-settings.dconf
    - source: salt://opensuse/settings.dconf
  file.managed:
    - name: /home/ilmehtar/.autostart.sh
    - source: salt://opensuse/autostart.sh
  file.managed:
    - name: /home/ilmehtar/.config/autostart/startup.desktop
    - source: salt://opensuse/startup.desktop
  file.managed:
    - name: /home/ilmehtar/.config/terminator/config
    - source: salt://opensuse/terminator-config
