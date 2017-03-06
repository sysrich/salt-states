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
