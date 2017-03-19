include:
  - opensuse.desktop

/usr/local/sbin/rootco-obiwan-backup:
  file.managed:
    - user: root
    - group: root
    - mode: 700
    - source: salt://opensuse/rootco-obiwan-backup

/etc/systemd/system/rootco-obiwan-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://opensuse/rootco-obiwan-backup.service
    - template: jinja
    - require:
      - file: /usr/local/sbin/rootco-obiwan-backup

/etc/systemd/system/rootco-obiwan-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://opensuse/rootco-obiwan-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-obiwan-backup.service

rootco-obiwan-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-obiwan-backup.timer
