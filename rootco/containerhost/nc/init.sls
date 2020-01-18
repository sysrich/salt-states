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
    - source: salt://rootco/containerhost/nc/nginx.conf
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
    - source: salt://rootco/containerhost/nc/nextcloud.service

/etc/systemd/system/ncnginx.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/nc/ncnginx.service
    - require:
      - file: /var/opt/ncserver/nginx/nginx.conf

/etc/systemd/system/ncserver.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/nc/ncserver.service
    - require:
      - file: /var/opt/ncserver/nextcloud

/etc/systemd/system/ncdb.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/nc/ncdb.service
    - require:
      - file: /var/opt/ncserver/db

nextcloud.service:
  service.running:
    - enable: Tru
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
    - source: salt://rootco/containerhost/nc/certbot.service

/etc/systemd/system/certbot.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/nc/certbot.timer

certbot.timer:
  service.running:
    - enable: True
