base:
  'luke.rootco.de':
    - opensuse.server
    - sshd
    - salt.master # TODO: Replace with container
    - rootco.web # TODO: Replace with container
    - rootco.git # TODO: Decomission, never used it
    - znc # TODO: Replace with container
  'ibrokeit.suse.de':
    - opensuse.desktop
    - znc # TODO: Replace with container
#  'bb8.rootco.de':     # disabled as not in use, kept for reference
#    - opensuse.jeos
#    - sshd
#    - rootco.piap
  'k2so.dyn.rootco.de':
    - opensuse.jeos
    - sshd
    - rootco.backer
  'r2d2.home.rootco.de':
    - opensuse.microos
#    - rootco.backer.r2d2 # TODO: Rules for backing up various /var/opt snippits from containers hosted on r2d2 to backer container and for salt://rootco/backer/backups.conf snapper conf, /backups disk mounts, and rsync services to hetzner
#    - rootco.containerhost.r2d2 # TODO: All the /etc/systemd/system config for my rootco containers on r2d2
    - sshd
   'nc.rootco.de':
    - opensuse.microos
    - sshd
#  'newluke.rootco.de': # DOESNT EXIST YET
#    - opensuse.microos
#    - rootco.containerhost.luke
#    - sshd
  'iwreckit.suse.de':
    - opensuse.laptop
  'bb8.dyn.rootco.de':
    - opensuse.laptop
  'backer.container.r2d2.dyn.rootco.de':
    - rootco.backer
