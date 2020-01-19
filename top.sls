base:
  '*':
    - opensuse
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
  'r2d2.home.rootco.de':
    - opensuse.microos
    - rootco.backer
    - rootco.containerhost.r2d2
    - sshd
  'nc.rootco.de':
    - opensuse.microos
    - rootco.containerhost.nc
    - sshd
#  'newluke.rootco.de': # DOESNT EXIST YET
#    - opensuse.microos
#    - rootco.containerhost.luke
#    - sshd
  'iwreckit.suse.de':
    - opensuse.laptop
  'bb8.dyn.rootco.de':
    - opensuse.laptop
