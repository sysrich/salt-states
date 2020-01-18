#TODO: Rules for backing up various /var/opt snippits from containers hosted on r2d2 to backer container and for salt://rootco/backer/backups.conf snapper conf, /backups disk mounts, and rsync services to hetzner

# /var/opt/znc: - TODO backup to backer container

etc/snapper/configs/backups:
  file.managed:
    - user: root
    - group: root
    - mode: 640
    - source: salt://rootco/backer/backups.conf
    - create: False

#/var/opt/nextcloud - TODO sync to hetzner

/var/opt/backer/backups:
  mount.mounted:
    - device: /dev/sdb1
    - fstype: btrfs
  # TODO sync to hetzner

