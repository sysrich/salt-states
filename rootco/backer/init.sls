backer.packages:
  pkg.installed:
    - pkgs:
      - snapper
      - btrfsprogs
      - cryptsetup
      - duperemove
    - require:
      - pkg: myopensuse.packages

/backups:
  file.directory:
    - user: backer
    - group: users
    - mode: 770
    - require:
      - user: backer
  mount.mounted:
    - device: /dev/mapper/backups
    - fstype: btrfs
    - mount: False

/etc/snapper/configs/backups:
  file.managed:
    - user: root
    - group: root
    - mode: 640
    - source: salt://rootco/backer/backups.conf
    - create: False

/usr/local/sbin/backer-disk-setup:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://rootco/backer/backer-disk-setup

/usr/local/sbin/backer-unlock:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://rootco/backer/backer-unlock

/usr/local/sbin/lxc-hook-sdb:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://rootco/backer/lxc-hook-sdb

/etc/profile.local:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://rootco/backer/profile.local

/usr/local/sbin/backer-unmount-alarm:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://rootco/backer/backer-unmount-alarm
  cron.present:
    - user: root
    - minute: '*/1'

backer:
  user.present:
    - fullname: Backer Server User
    - shell: /bin/false
    - home: /backups/.backerhome
    - createhome: True
    - require:
       - mount: /backups

/backups/.backerhome/.ssh/authorized_keys:
  file.managed:
    - user: backer
    - mode: 600
    - makedirs: True
    - dirmode: 700
    - contents:
{% for host_key in salt ['mine.get']('*', 'backer_client_host_key').items() %}
      - no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding {{ host_key[1] }}
{% endfor %}
    - require:
      - user: backer

