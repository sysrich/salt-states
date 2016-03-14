include:
  - apache

rootco.de-web:
  git.latest:
    - name: https://github.com/sysrich/rootco.de-web.git
    - target: /srv/www/source
    - require:
      - pkg: apache2

/srv/www/htdocs:
  file.copy:
    - source: /srv/www/source/_site
    - force: true
    - preserve: true
