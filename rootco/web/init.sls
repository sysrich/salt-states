include:
  - apache

rootco.de-web:
  git.latest:
    - name: https://github.com/sysrich/rootco.de-web.git
    - target: /srv/www/source
    - require:
      - pkg: apache2

jekyll_site:
  file.copy:
    - name: /srv/www/htdocs
    - source: /srv/www/source/_site
    - user: wwwrun
    - group: www
    - mode: 444
    - makedirs
    - require:
      - git: rootco.de-web
