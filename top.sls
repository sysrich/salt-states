base:
  '*':
    - opensuse
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
  'd0.rootco.de':
    - opensuse.microos
    - rootco.containerhost.d0 # TODO: Port services over
    - sshd
  'iwreckit.suse.de':
    - opensuse.laptop
  'bb8.dyn.rootco.de':
    - opensuse.laptop
