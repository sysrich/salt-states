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

/etc/systemd/system/rootco-measure-upload.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/rootco-measure-upload.service

/etc/systemd/system/rootco-measure-upload.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/rootco-measure-upload.timer

/usr/local/bin/measure-upload.sh:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://rootco/containerhost/r2d2/measure-upload.sh

rootco-measure-upload.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-measure-upload.service
      - file: /etc/systemd/system/rootco-measure-upload.timer
      - file: /usr/local/bin/measure-upload.sh
      - file: /disk/nextcloud

/etc/systemd/system/rootco-measure-download.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/rootco-measure-download.service

/etc/systemd/system/rootco-measure-download.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/rootco-measure-download.timer

/usr/local/bin/measure-download.sh:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://rootco/containerhost/r2d2/measure-download.sh

rootco-measure-download.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-measure-download.service
      - file: /etc/systemd/system/rootco-measure-download.timer
      - file: /usr/local/bin/measure-download.sh
      - file: /disk/nextcloud

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
