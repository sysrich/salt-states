piap.packages
  pkg.installed:
    - pkgs:
      - hostapd
      - dnsmasq
    - require:
      - pkg: myopensuse.packages

/etc/sysconfig/network/ifcfg-wlan1:
  file.managed:
    - source: salt://rootco/piap/ifcfg-wlan1
    - mode: 600
    - user: root
    - group: root
    - require:
      - user: root

network:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/sysconfig/network/ifcfg-wlan1
