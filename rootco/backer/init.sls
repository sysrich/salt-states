/etc/snapper/configs/backups:
  file.managed:
    - user: root
    - group: root
    - mode: 640
    - source: salt://rootco/backer/backups.conf
    - create: False   #NOTE: If ever installing from scratch you need to create this using `snapper -c backups create-config /disk/backer && snapper -c backups setup-quota` first
    - require:
      - file: /disk/backer

/disk:
  mount.mounted:
    - device: UUID=9f8c7f17-9735-4dfa-9f7a-b9f88cf345f0
    - fstype: btrfs

/disk/backer: 
  file.exists:
    - require:
      - mount: /disk

/var/opt/backer/keys:
  file.directory:
    - user: root
    - group: root
    - makedirs: true

/var/opt/backer/sshd:
  file.directory:
    - user: root
    - group: root
    - makedirs: true

/var/opt/backer/keys/authorized_keys:
  file.managed:
    - user: root
    - mode: 600
    - makedirs: True
    - dirmode: 700
    - template: jinja
    - contents:
{% for host_key in salt ['mine.get']('*', 'backer_client_host_key').items() %}
      - no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding {{ host_key[1] }}
{% endfor %}

/etc/systemd/system/rootco-backer-srv.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/backer/rootco-backer-srv.service
    - require:
      - file: /var/opt/backer/keys
      - file: /var/opt/backer/sshd
      - file: /disk/backer

rootco-backer-srv.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-backer-srv.service

/etc/systemd/system/rootco-hetzner-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/backer/rootco-hetzner-backup.timer
    - require:
      - file: /etc/systemd/system/rootco-hetzner-backup.service

rootco-hetzner-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-hetzner-backup.timer

/etc/systemd/system/rootco-hetzner-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/backer/rootco-hetzner-backup.service
