apache2:
  pkg.installed: []
  service.running:
    - require:
      - pkg: apache2
      - file: /srv/www/htdocs
      - pkg: myopensuse.packages

/srv/www/htdocs:
  file.directory:
    - user: wwwrun
    - group: www
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
      - ignore_dirs

/etc/apache2/default-server.conf:
  apache.configfile:
    - config:
      - Directory:
        this: /srv/www/htdocs
        AllowOverride: All
    - require:
      - pkg: apache2
