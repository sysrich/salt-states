piap.packages:
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

/etc/hostapd.conf:
  file.managed:
    - source: salt://rootco/piap/hostapd.conf
    - mode: 600
    - user: root
    - group: root
    - require:
      - pkg: piap.packages

hostapd:
  service.running:
    - enable: True
    - full_restart: True
    - watch:
      - file: /etc/hostapd.conf

/etc/dnsmasq.d/dnsmasqpiap.conf:
  file.managed:
    - source: salt://rootco/piap/dnsmasqpiap.conf
    - mode: 600
    - user: root
    - group: root
    - require:
      - pkg: piap.packages

dnsmasq:
  service.running:
    - enable: True
    - full_restart: True
    - watch:
      - file: /etc/dnsmasq.d/dnsmasqpiap.conf
