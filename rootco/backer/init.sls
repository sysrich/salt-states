backer.packages:
  pkg.installed:
    - pkgs:
      - snapper
      - btrfsprogs
      - cryptsetup
    - require:
      - pkg: myopensuse.packages

/dev/sdb:
  file.managed:
    - mode: 644

