include:
  - apache

rootco.de-web:
  git.latest:
    - name: https://github.com/sysrich/rootco.de-web.git
    - target: /srv/git/rootco.de-web
    - user: wwwrun
    - require:
      - pkg: apache2
      - file: /srv/www/htdocs

git -C /srv/git/rootco.de-web pull -q:
  cron.present:
    - user: wwwrun
    - minute: '*/5'
    - require:
      - git: rootco.de-web

certbot:
  git.latest:
    - name: https://github.com/certbot/certbot
    - target: /opt/certbot
    - user: root
