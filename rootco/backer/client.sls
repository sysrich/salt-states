backerclient:
  user.present:
    - fullname: Backer Client User
    - shell: /bin/false
    - home: /home/backerclient
    - createhome: True
    - groups:
      - wheel

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
    - require:
      - user: backerclient

known_hosts_k2so:
  file.line:
    - name: /home/backerclient/.ssh/known_hosts
    - mode: insert
    - location: start
    - content: "[k2so.dyn.rootco.de]:8282 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBCCsRvNPNCo2UWN5hOOCt70UqJdGKuKpkP5Y3EAMzWEMv+9L8NsjmfWCDD4VkL3raSuSFxJ4qDJVC8emCj6OXPE="

ssh-keygen -N "" -f /home/backerclient/.ssh/id_rsa:
  cmd.run:
    - user: backerclient
    - creates: /home/backerclient/.ssh/id_rsa
    - require:
      - file: /home/backerclient/.ssh/config

