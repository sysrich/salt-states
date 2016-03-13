saltmaster.packages:
  pkg.installed:
    - pkgs:
      - salt-master

git -C /srv/salt pull:
  cron.present:
    - user: root
    - minute: '*/5'
