saltmaster.packages:
  pkg.installed:
    - pkgs:
      - salt-master

git -C /srv/salt pull:
  cron.present:
    - user: root
    - minute: '*/5'

/srv/git/salt-states:
  file.symlink:
    - target: /srv/salt
