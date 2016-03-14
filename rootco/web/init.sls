include:
  - apache

rootco.de-web:
  git.latest:
    - name: https://github.com/sysrich/rootco.de-web.git
    - target: /srv/www/source
    - user: wwwrun
    - require:
      - pkg: apache2
      - file: /srv/www/htdocs

git -C /srv/www/source pull:
  cron.present:
    - user: wwwrun
    - minute: '*/15'
    - require:
      - git: rootco.de-web
