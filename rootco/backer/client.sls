/root/.ssh/config:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - makedirs: True
    - dirmode: 700
    - contents:
      - Host cloud.dyn.rootco.de
      - Port 80

/root/.ssh/known_hosts:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - makedirs: True
    - dirmode: 700
    - contents:
      - "cloud.dyn.rootco.de ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEeqEDWXOwIjp16/qE8lR9+U4Mc0sOslggs4I0ayGf9DEfBj2RZ9Gv/s9jE2JhWtcUDyxzHlZBB79dSUzMAet2s="

touch /root/.ssh/id_rsa.pub:
  cmd.run:
    - user: root
    - creates: /root/.ssh/id_rsa.pub
    - require:
      - file: /root/.ssh/config

ssh-keygen -N "" -f /root/.ssh/id_rsa:
  cmd.run:
    - user: root
    - unless: grep -q ssh /root/.ssh/id_rsa.pub
    - require:
      - file: /root/.ssh/config

/etc/systemd/system/rootco-etc-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/backer/rootco-etc-backup.service
    - template: jinja

/etc/systemd/system/rootco-etc-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/backer/rootco-etc-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-etc-backup.service

rootco-etc-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-etc-backup.timer
