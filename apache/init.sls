apache2:
  pkg.installed: []
  service.running:
    - watch:
      - file: /etc/apache2/conf.d/htdocs-allow-override.conf    
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

/etc/apache2/conf.d/htdocs-allow-override.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents:
      - <Directory "/srv/www/htdocs">
      - AllowOverride All
      - </Directory>
    - require:
      - pkg: apache2
