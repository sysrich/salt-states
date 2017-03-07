backer.packages:
  pkg.installed:
    - pkgs:
      - snapper
      - btrfsprogs
      - cryptsetup
    - require:
      - pkg: myopensuse.packages

/backups:
  file.directory:
    - user: ilmehtar
    - group: users
    - mode: 770
    - require:
      - user: ilmehtar

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
