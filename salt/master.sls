saltmaster.packages:
  pkg.installed:
    - pkgs:
      - salt-master

git -C /srv/salt pull: #pointless comment
  cron.present:
    - user: root
    - minute: '*/5'
