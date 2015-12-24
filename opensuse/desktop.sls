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
  cmd.wait_script:
    - source: salt://opensuse/default-dconf.sh
    - user: ilmehtar
    - watch:
      - file: /home/ilmehtar/.default-settings.dconf
    - require:
      - user: ilmehtar
      - pkg: gedit-packages
  file.managed:
    - name: /home/ilmehtar/.default-settings.dconf
    - source: salt://opensuse/settings.dconf