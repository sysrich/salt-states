include:
  - opensuse.desktop

laptop.packages:
  pkg.installed:
    - pkgs:
      - tlp
      - powertop
    - require:
      - pkg: gedit-packages

tlp:
  service.running:
    - enable: True
    - require:
      - pkg: laptop.packages

tlp-sleep:
  service.enabled:
    - require:
      - pkg: laptop.packages
