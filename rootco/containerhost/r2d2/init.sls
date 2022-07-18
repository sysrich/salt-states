/var/opt/ncserver:
  file.directory:
    - user: root
    - group: root
    - makedirs: true

/var/opt/ncserver/nginx/nginx.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/nginx.conf
    - require:
      - file: /var/opt/ncserver

/var/opt/ncserver/db:
  file.directory:
    - makedirs: true
    - require:
      - file: /var/opt/ncserver

/disk/nextcloud:
  file.exists:
    - require:
      - mount: /disk

/etc/systemd/system/nextcloud.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/nextcloud.service

/etc/systemd/system/nextcloudcron.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/nextcloudcron.service

/etc/systemd/system/nextcloudcron.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/nextcloudcron.timer

/etc/systemd/system/ncnginx.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/ncnginx.service
    - require:
      - file: /var/opt/ncserver/nginx/nginx.conf
      - file: /disk/nextcloud

/etc/systemd/system/ncserver.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/ncserver.service
    - require:
      - file: /disk/nextcloud

/etc/systemd/system/ncdb.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/ncdb.service
    - require:
      - file: /var/opt/ncserver/db

nextcloud.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/nextcloud.service
      - file: /etc/systemd/system/ncnginx.service
      - file: /etc/systemd/system/ncserver.service
      - file: /etc/systemd/system/ncdb.service

nextcloudcron.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/nextcloudcron.service
      - file: /etc/systemd/system/nextcloudcron.timer

/etc/systemd/system/certbot.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/certbot.service

/etc/systemd/system/certbot.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/certbot.timer

certbot.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/certbot.service
      - file: /etc/systemd/system/certbot.timer

/etc/systemd/system/rootco-photosync.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/rootco-photosync.service

/etc/udev/rules.d/70-photosync.rules:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/70-photosync.rules

/etc/systemd/system/ncdb-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/ncdb-backup.service
    - template: jinja

/etc/systemd/system/ncdb-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/ncdb-backup.timer
    - require:
      - file: /etc/systemd/system/ncdb-backup.service

ncdb-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/ncdb-backup.timer

/etc/systemd/system/staging-bot.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/staging-bot.service

staging-bot.service:
  service.running:
    - enable: True

# TODO fix this broken hot mess
#/var/opt/sslh/sslh.cfg:
#  file.managed:
#    - user: root
#    - group: root
#    - mode: 644
#    - makedirs: true
#    - source: salt://rootco/containerhost/r2d2/sslh.cfg
#
#/etc/systemd/system/rootco-sslh.service:
#  file.managed:
#    - user: root
#    - group: root
#    - mode: 644
#    - source: salt://rootco/containerhost/r2d2/rootco-sslh.service
#
#rootco-sslh.service:
#  service.running:
#    - enable: True

# /var/opt/ncserver - TODO sync to hetzner
