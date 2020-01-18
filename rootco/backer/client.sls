/root/.ssh/config:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - makedirs: True
    - dirmode: 700
    - contents:
      - Host cloud.dyn.rootco.de
      - Port 22

/root/.ssh/known_hosts:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - makedirs: True
    - dirmode: 700
    - contents:
      - "cloud.dyn.rootco.de ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBM9mDDugJOLMjA+84IC0yIXAx9ocoK2dj1C+yn0iB6tNjjlQEryVj6dc6RtrvfmtJa+O8d177FvTio2lk6esmA8="

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
