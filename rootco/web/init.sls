include:
  - apache

rootco.de-web:
  git.latest:
    - name: https://github.com/sysrich/rootco.de-web.git
    - target: /srv/www/source
    - require:
      - pkg: apache2
      - file: /srv/www/htdocs

