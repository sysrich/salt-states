backerclient:
  user.present:
    - fullname: Backer Client User
    - shell: /bin/false
    - home: /home/backerclient
    - createhome: True

/home/backerclient:
  file.directory:
    - dir_mode: 700
    - require:
      - user: backerclient

/home/backerclient/.ssh/config:
  file.managed:
    - user: backerclient
    - group: users
    - mode: 600
    - makedirs: True
    - dirmode: 700
    - contents:
      - Host k2so.dyn.rootco.de
      - Port 8282
    - require:
      - user: backerclient

/home/backerclient/.ssh/known_hosts:
  file.managed:
    - user: backerclient
    - group: users
    - mode: 600
    - makedirs: True
    - dirmode: 700
    - contents:
      - "[k2so.dyn.rootco.de]:8282 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBCCsRvNPNCo2UWN5hOOCt70UqJdGKuKpkP5Y3EAMzWEMv+9L8NsjmfWCDD4VkL3raSuSFxJ4qDJVC8emCj6OXPE="
    - require:
      - user: backerclient

ssh-keygen -N "" -f /home/backerclient/.ssh/id_rsa:
  cmd.run:
    - user: backerclient
    - creates: /home/backerclient/.ssh/id_rsa
    - require:
      - file: /home/backerclient/.ssh/config

/etc/sudoers.d/backerclient:
  file.managed:
    - name: /etc/sudoers.d/backerclient
    - mode: 600
    - contents:
      - 'backerclient ALL=(ALL) NOPASSWD: /usr/bin/rsync'
      - 'backerclient ALL=(ALL) NOPASSWD: /usr/bin/csync'

/etc/systemd/system/rootco-etc-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/backer/rootco-etc-backup.service
    - template: jinja
    - require:
      - user: backerclient

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
