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

rootco-etc-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-minecraft-backup.timer
