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
  'obiwan.rootco.de':
    - opensuse.desktop
  'ibrokeit.suse.de':
    - opensuse.desktop
    - znc
  'bb8.rootco.de':
    - opensuse.jeos
    - sshd
    - rootco.piap
  'k2so.dyn.rootco.de':
    - opensuse.jeos
    - sshd
# 'rey.rootco.de':	    # stolen
#   - opensuse.laptop
