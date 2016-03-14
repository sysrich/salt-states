apache2:
  pkg.installed: []
  service.running:
    - require:
      - pkg: apache2
      - file: /srv/www/htdocs
