include:
  - opensuse.desktop

laptop.packages:
  pkg.installed:
    - pkgs:
      - tlp
      - powertop
    - require:
      - pkg: gedit-packages
