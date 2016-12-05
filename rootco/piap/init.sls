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

/etc/dnsmasq.conf:
  file.managed:
    - source: salt://rootco/piap/dnsmasq.conf
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
      - file: /etc/dnsmasq.conf

/etc/sysctl.d/ipforward.conf:
  file.managed:
    - source: salt://rootco/piap/ipforward.conf
    - mode: 600
    - user: root
    - group: root

Enable IP forwarding now:
  cmd.run:
    - name: echo 1 > /proc/sys/net/ipv4/ip_forward
    - cwd: /
    - onchanges:
      - file: /etc/sysctl.d/ipforward.conf

iptables-masquerade:
  iptables.append:
    - table: nat
    - chain: POSTROUTING
    - out-interface: wlan0
    - jump: MASQUERADE
    - save: True

iptables-incoming:
  iptables.append:
    - table: filter
    - chain: FORWARD
    - in-interface: wlan0
    - out-interface: wlan1
    - jump: ACCEPT
    - match: state
    - connstate: RELATED,ESTABLISHED
    - save: True

iptables-outgoing:
  iptables.append:
    - table: filter
    - chain: FORWARD
    - in-interface: wlan1
    - out-interface: wlan0
    - jump: ACCEPT
    - save: True
