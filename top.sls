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
  'rey.rootco.de':
    - opensuse.laptop
  'obiwan.rootco.de':
    - opensuse.desktop
  'ibrokeit.suse.de':
    - opensuse.desktop
    - znc
