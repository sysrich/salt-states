apache:
  pkg.installed: []
  service.running:
    - require:
      - pkg: apache
