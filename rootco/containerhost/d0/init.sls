/etc/systemd/system/minecraft.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/minecraft.service

minecraft.service:
  service.running:
    - enable: True

/etc/systemd/system/rootco-minecraft-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-minecraft-backup.service
    - template: jinja

/etc/systemd/system/rootco-minecraft-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/d0/rootco-minecraft-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-minecraft-backup.service

rootco-minecraft-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-minecraft-backup.timer

/var/opt/salt-master:
  file.directory:
    - user: root
    - group: 479
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
    - user: root
    - group: root
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

/var/opt/rootco-web/certbot:
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
      - file: /var/opt/rootco-web/htdocs

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

systemctl start rootco-certbot.service:
  cmd.run:
    - require:
      - file: /etc/systemd/system/rootco-certbot.service

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
    - user: root
    - group: root
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
