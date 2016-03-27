desktop-packages:
  pkg.installed:
    - pkgs:
      - terminator
      - python-notify
      - osc
      - dconf-editor
    - require:
      - pkg: myopensuse.packages

gedit-packages:
  pkg.installed:
    - pkgs:
      - gedit-plugins
      - gedit-plugin-code-assistance
      - gedit-plugin-codecomment
      - gedit-plugin-wordcompletion
      - gedit-plugin-drawspaces
    - require:
      - pkg: desktop-packages

dconf-defaults:
  file.managed:
    - name: /home/ilmehtar/.defaultsettings.dconf
    - source: salt://opensuse/settings.dconf
    - user: ilmehtar
    - group: users
    - require:
      - user: ilmehtar
      - pkg: gedit-packages

autostart-script:
  file.managed:
    - name: /home/ilmehtar/.autostart.sh
    - source: salt://opensuse/autostart.sh
    - mode: 744
    - user: ilmehtar
    - group: users
    - require:
      - file: dconf-defaults

autostart-desktop:
  file.managed:
    - name: /home/ilmehtar/.config/autostart/startup.desktop
    - source: salt://opensuse/startup.desktop
    - mode: 744
    - user: ilmehtar
    - group: users
    - makedirs : true
    - require:
      - file: autostart-script
      - file: terminator-config

terminator-config:
  file.managed:
    - name: /home/ilmehtar/.config/terminator/config
    - source: salt://opensuse/terminator-config
    - makedirs: true
    - user: ilmehtar
    - group: users
    - require:
      - user: ilmehtar
      - pkg: desktop-packages
