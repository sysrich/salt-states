znc:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: znc
      - pkg: myopensuse.packages

/etc/systemd/system/rootco-znc-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://znc/rootco-znc-backup.service
    - template: jinja

/etc/systemd/system/rootco-znc-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://znc/rootco-znc-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-znc-backup.service

rootco-znc-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-znc-backup.timer
