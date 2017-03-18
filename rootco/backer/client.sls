/root/.ssh/config:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - makedirs: True
    - dirmode: 700
    - contents:
      - Host k2so.dyn.rootco.de
      - Port 8282

/root/.ssh/known_hosts:
  file.managed:
    - user: root
    - group: root
    - mode: 600
    - makedirs: True
    - dirmode: 700
    - contents:
      - "[k2so.dyn.rootco.de]:8282 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBCCsRvNPNCo2UWN5hOOCt70UqJdGKuKpkP5Y3EAMzWEMv+9L8NsjmfWCDD4VkL3raSuSFxJ4qDJVC8emCj6OXPE="

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
