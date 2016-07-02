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

/etc/apache2/vhosts.d/SSL-rootco.de.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/web/SSL-rootco.de.conf
    - require:
      - pkg: apache2

/opt/certbot/certbot-auto renew >/dev/null 2>&1:
  cron.present:
    - user: root
    - minute: 0
    - hour: 0
    - daymonth: 1
    - month: */2
    - require:
      - git: certbot

