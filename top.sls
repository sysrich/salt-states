base:
  '*':
    - opensuse
    - salt.minion
  'luke.rootco.de':
    - opensuse.server
    - sshd
    - salt.master
    - rootco.web
    - rootco.git
    - znc
  'obiwan.dyn.rootco.de':
    - opensuse.obiwan
  'ibrokeit.suse.de':
    - opensuse.desktop
    - znc
#  'bb8.rootco.de':     # disabled as not in use
#    - opensuse.jeos
#    - sshd
#    - rootco.piap
  'k2so.dyn.rootco.de':
    - opensuse.jeos
    - sshd
    - rootco.backer
  'r2d2.dyn.rootco.de':
    - opensuse.jeos
    - sshd
  'iwreckit.suse.de':
    - opensuse.laptop
# 'rey.rootco.de':      # stolen
#   - opensuse.laptop
  'bb8.dyn.rootco.de':
    - opensuse.laptop
