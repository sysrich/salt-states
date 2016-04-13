znc:
  pkg.installed: []
  service.running:
    - require:
      - pkg: znc
      - pkg: myopensuse.packages
