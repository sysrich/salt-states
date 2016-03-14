include:
  - apache

rootco.de-web:
  git.latest:
    - name: https://github.com/sysrich/rootco.de-web.git
    - target: /srv/www/htdocs
    - user: wwwrun
    - require:
      - pkg: apache2
