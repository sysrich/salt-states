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
    - user: 999
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/ncserver

/var/opt/ncserver/nextcloud:
  file.directory:
    - user: 33
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/ncserver

/etc/systemd/system/nextcloud.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/nextcloud.service

/etc/systemd/system/ncnginx.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/ncnginx.service
    - require:
      - file: /var/opt/ncserver/nginx/nginx.conf

/etc/systemd/system/ncserver.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/ncserver.service
    - require:
      - file: /var/opt/ncserver/nextcloud

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

/var/opt/sslh/sslh.cfg:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - makedirs: true
    - source: salt://rootco/containerhost/r2d2/sslh.cfg

/etc/systemd/system/rootco-sslh.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r2d2/rootco-sslh.service

rootco-sslh.service:
  service.running:
    - enable: True

# /var/opt/ncserver - TODO sync to hetzner
# /var/opt/znc: - TODO backup to backer container