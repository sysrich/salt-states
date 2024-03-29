/var/opt/salt-master:
  file.directory:
    - makedirs: true

/etc/systemd/system/rootco-salt-master.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-salt-master.service

rootco-salt-master.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-salt-master.service

/etc/systemd/system/rootco-salt-master-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-salt-master-backup.service
    - template: jinja

/etc/systemd/system/rootco-salt-master-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-salt-master-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-salt-master-backup.service

rootco-salt-master-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-salt-master-backup.timer

/var/opt/rootco-jekyll:
  file.directory:
    - makedirs: true

/etc/systemd/system/rootco-jekyll.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-jekyll.service
    - require:
      - file: /var/opt/rootco-jekyll

systemctl start rootco-jekyll.service:
  cmd.run:
    - require:
      - file: /etc/systemd/system/rootco-jekyll.service
      - file: /var/opt/rootco-web/data

/etc/systemd/system/rootco-jekyll.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-jekyll.timer
    - require:
      - file: /etc/systemd/system/rootco-jekyll.service

rootco-jekyll.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-jekyll.timer

/etc/systemd/system/rootco-jekyll-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-jekyll-backup.service
    - template: jinja

/etc/systemd/system/rootco-jekyll-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-jekyll-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-jekyll-backup.service

rootco-jekyll-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-jekyll-backup.timer

/etc/systemd/system/rootco-web.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-web.service

/var/opt/rootco-web:
  file.directory:
    - user: root
    - group: root
    - makedirs: true

/var/opt/rootco-web/data:
  file.directory:
    - user: root
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/rootco-web

/var/opt/rootco-web/data/htdocs:
  file.exists:
    - require:
      - cmd: systemctl start rootco-jekyll.service

/var/opt/rootco-web/letsencrypt:
  file.directory:
    - user: root
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/rootco-web

rootco-web.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-web.service

/etc/systemd/system/rootco-web-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-web-backup.service
    - template: jinja

/etc/systemd/system/rootco-web-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-web-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-web-backup.service

rootco-web-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-web-backup.timer

/etc/systemd/system/rootco-certbot.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-certbot.service

/etc/systemd/system/rootco-certbot.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-certbot.timer
    - require:
      - file: /etc/systemd/system/rootco-certbot.service

rootco-certbot.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-certbot.timer

/var/opt/rootco-znc:
  file.directory:
    - makedirs: true

/etc/systemd/system/rootco-znc.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-znc.service

rootco-znc.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-znc.service

/etc/systemd/system/rootco-znc-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-znc-backup.service
    - template: jinja

/etc/systemd/system/rootco-znc-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-znc-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-znc-backup.service

rootco-znc-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-znc-backup.timer

/var/opt/iris:
  file.directory:
    - user: root
    - group: root
    - makedirs: true

/var/opt/iris/db:
  file.directory:
    - user: root
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/iris

/var/opt/iris/html:
  file.directory:
    - user: root
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/iris

/etc/systemd/system/rootco-iris-db.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-iris-db.service

/etc/systemd/system/rootco-iris-web.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-iris-web.service

/etc/systemd/system/rootco-iris.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-iris.service

rootco-iris.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-iris.service
      - file: /etc/systemd/system/rootco-iris-db.service
      - file: /etc/systemd/system/rootco-iris-web.service
      - file: /var/opt/iris/html
      - file: /var/opt/iris/db

/etc/systemd/system/rootco-iris-web-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-iris-web-backup.service
    - template: jinja

/etc/systemd/system/rootco-iris-web-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-iris-web-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-iris-web-backup.service

rootco-iris-web-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-iris-web-backup.timer

/etc/systemd/system/rootco-iris-db-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-iris-db-backup.service
    - template: jinja

/etc/systemd/system/rootco-iris-db-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-iris-db-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-iris-db-backup.service

rootco-iris-db-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-iris-db-backup.timer

/var/opt/coaching:
  file.directory:
    - user: root
    - group: root
    - makedirs: true

/var/opt/coaching/db:
  file.directory:
    - user: root
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/coaching

/var/opt/coaching/html:
  file.directory:
    - user: root
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/coaching

/etc/systemd/system/rootco-coaching.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-coaching.service

rootco-coaching.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-coaching.service
      - file: /etc/systemd/system/rootco-coaching-db.service
      - file: /etc/systemd/system/rootco-coaching-web.service
      - file: /var/opt/coaching/html
      - file: /var/opt/coaching/db

/etc/systemd/system/rootco-coaching-db.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-coaching-db.service

/etc/systemd/system/rootco-coaching-web.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-coaching-web.service

/etc/systemd/system/rootco-coaching-web-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-coaching-web-backup.service
    - template: jinja

/etc/systemd/system/rootco-coaching-web-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-coaching-web-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-coaching-web-backup.service

rootco-coaching-web-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-coaching-web-backup.timer

/etc/systemd/system/rootco-coaching-db-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-coaching-db-backup.service
    - template: jinja

/etc/systemd/system/rootco-coaching-db-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-coaching-db-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-coaching-db-backup.service

rootco-coaching-db-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-coaching-db-backup.timer

/var/opt/photos:
  file.directory:
    - user: root
    - group: root
    - makedirs: true

/var/opt/photos/db:
  file.directory:
    - user: root
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/photos

/var/opt/photos/html:
  file.directory:
    - user: root
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/photos

/etc/systemd/system/rootco-photos.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-photos.service

rootco-photos.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-photos.service
      - file: /etc/systemd/system/rootco-photos-db.service
      - file: /etc/systemd/system/rootco-photos-web.service
      - file: /var/opt/photos/html
      - file: /var/opt/photos/db

/etc/systemd/system/rootco-photos-db.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-photos-db.service

/etc/systemd/system/rootco-photos-web.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-photos-web.service

/etc/systemd/system/rootco-photos-web-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-photos-web-backup.service
    - template: jinja

/etc/systemd/system/rootco-photos-web-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-photos-web-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-photos-web-backup.service

rootco-photos-web-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-photos-web-backup.timer

/etc/systemd/system/rootco-photos-db-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-photos-db-backup.service
    - template: jinja

/etc/systemd/system/rootco-photos-db-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-photos-db-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-photos-db-backup.service

rootco-photos-db-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-photos-db-backup.timer
      
/var/opt/opera:
  file.directory:
    - user: root
    - group: root
    - makedirs: true

/var/opt/opera/db:
  file.directory:
    - user: root
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/opera

/var/opt/opera/html:
  file.directory:
    - user: root
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/opera

/etc/systemd/system/rootco-opera-db.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-opera-db.service

/etc/systemd/system/rootco-opera-web.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-opera-web.service

/etc/systemd/system/rootco-opera.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-opera.service

rootco-opera.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-opera.service
      - file: /etc/systemd/system/rootco-opera-db.service
      - file: /etc/systemd/system/rootco-opera-web.service
      - file: /var/opt/opera/html
      - file: /var/opt/opera/db

/etc/systemd/system/rootco-opera-web-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-opera-web-backup.service
    - template: jinja

/etc/systemd/system/rootco-opera-web-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-opera-web-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-opera-web-backup.service

rootco-opera-web-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-opera-web-backup.timer

/etc/systemd/system/rootco-opera-db-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-opera-db-backup.service
    - template: jinja

/etc/systemd/system/rootco-opera-db-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-opera-db-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-opera-db-backup.service

rootco-opera-db-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-opera-db-backup.timer

