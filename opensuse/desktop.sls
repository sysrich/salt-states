desktop.packages:
  pkg.installed:
    - pkgs:
      - terminator
      - osc

gedit-packages:
  pkg.installed:
    - pkgs:
      - gedit-plugins
      - gedit-plugin-bracketcompletion
      - gedit-plugin-code-assistance
      - gedit-plugin-codecomment
      - gedit-plugin-wordcompletion
      - gedit-plugin-drawspaces

gedit-config:
  cmd.wait:
    - name: /usr/bin/dconf load /org/gnome/gedit/ < /tmp/gedit-conf.dconf
    - user: ilmehtar
    - watch:
      - pkg: gedit-packages
    - require:
      - user: ilmehtar
  file.managed:
    - name: /tmp/gedit-conf.dconf
    - source: salt://opensuse/gedit-conf.dconf
