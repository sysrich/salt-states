znc:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: znc
      - pkg: myopensuse.packages
