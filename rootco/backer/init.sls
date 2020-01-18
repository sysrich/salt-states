/etc/snapper/configs/backups:
  file.managed:
    - user: root
    - group: root
    - mode: 640
    - source: salt://rootco/backer/backups.conf
    - create: False
    - require:
      - file: /disk/backer

/disk:
  mount.mounted:
    - device: UUID=9e576eca-0750-4f5f-a78d-b95823ea8348
    - fstype: btrfs

/disk/backer:   # TODO sync to hetzner
  file.exists:
    - require:
      - mount: /disk

/var/opt/backer/keys:
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
      - file: /disk/backer

rootco-backer-srv.service:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/rootco-backer-srv.service


