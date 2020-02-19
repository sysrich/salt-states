/etc/systemd/system/rootco-mcproxy.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r4p17/rootco-mcproxy.service

/var/opt/rootco-mcproxy:
  file.directory:
    - user: root
    - group: root
    - makedirs: true

/var/opt/rootco-mcproxy/data:
  file.directory:
    - user: root
    - group: root
    - makedirs: true
    - require:
      - file: /var/opt/rootco-mcproxy

rootco-mcproxy.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-mcproxy.service

/etc/systemd/system/rootco-mcproxy-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r4p17/rootco-mcproxy-backup.service
    - template: jinja

/etc/systemd/system/rootco-mcproxy-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/containerhost/r4p17/rootco-mcproxy-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-mcproxy-backup.service

rootco-mcproxy-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-mcproxy-backup.timer
