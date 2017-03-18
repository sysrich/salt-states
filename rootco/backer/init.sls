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
    - user: ilmehtar
    - group: users
    - mode: 770
    - require:
      - user: ilmehtar
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

backerc:
  user.present:
    - fullname: Backer Csync User
    - shell: /bin/false
    - home: /backups/csync
    - createhome: True
    - require:
       - mount: /backups

backerr:
  user.present:
    - fullname: Backer Rsync User
    - shell: /bin/false
    - home: /backups/rsync
    - createhome: True
    - require:
       - mount: /backups

/backups/rsync/.ssh/authorized_keys:
  file.managed:
    - user: backerr
    - mode: 600
    - makedirs: True
    - dirmode: 700
    - contents:
{% for host_key in salt ['mine.get']('*', 'backer_client_host_key').items() %}
      - {{ host_key[1] }}
{% endfor %}
    - require:
      - user: backerr

/backups/csync/.ssh/authorized_keys:
  file.managed:
    - user: backerc
    - mode: 600
    - makedirs: True
    - dirmode: 700
    - contents:
{% for host_key in salt ['mine.get']('*', 'backer_client_host_key').items() %}
      - {{ host_key[1] }}
{% endfor %}
    - require:
      - user: backerc

