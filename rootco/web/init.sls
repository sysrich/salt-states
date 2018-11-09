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
  pkg.installed: []

/etc/apache2/vhosts.d/SSL-rootco.de.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/web/SSL-rootco.de.conf
    - require:
      - pkg: apache2

/usr/bin/certbot/certbot-auto renew --quiet --no-self-upgrade --post-hook "systemctl restart apache2":
  cron.present:
    - user: root
    - minute: 23
    - hour: 11,23
    - require:
      - pkg: certbot

/etc/systemd/system/rootco-web-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/web/rootco-web-backup.service
    - template: jinja

/etc/systemd/system/rootco-web-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/web/rootco-web-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-web-backup.service

rootco-web-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-web-backup.timer
