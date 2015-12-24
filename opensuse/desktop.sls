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

gedit-config:
  cmd.wait:
    - name: /usr/bin/dconf load / < /home/ilmehtar/.default-settings.dconf
    - user: ilmehtar
    - env:
        - DISPLAY: ':0'
    - watch:
      - file: /home/ilmehtar/.default-settings.dconf
    - require:
      - user: ilmehtar
      - pkg: gedit-packages
  file.managed:
    - name: /home/ilmehtar/.default-settings.dconf
    - source: salt://opensuse/settings.dconf
