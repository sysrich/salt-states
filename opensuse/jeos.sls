/etc/zypp/zypp.conf:
  file.managed:
    - source: salt://opensuse/zypp.conf
    - mode: 644
    - user: root
    - group: root
    - require:
      - user: root
