iptables-masquerade:
  iptables.append:
    - table: nat
    - chain: POSTROUTING
    - out-interface: wlan0
    - jump: MASQUERADE
    - save: True

# Tor iptables will be toggled at load time, but we want to make sure SSH always works
iptables-tor-ensuressh:
  iptables.append:
    - table: nat
    - chain: PREROUTING
    - in-interface: wlan0
    - proto: tcp
    - dport: 22
    - jump: REDIRECT
    - to-ports: 22
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

iptables-masquerade-eth0:
  iptables.append:
    - table: nat
    - chain: POSTROUTING
    - out-interface: eth0
    - jump: MASQUERADE
    - save: True

iptables-incoming-eth0:
  iptables.append:
    - table: filter
    - chain: FORWARD
    - in-interface: eth0
    - out-interface: wlan1
    - jump: ACCEPT
    - match: state
    - connstate: RELATED,ESTABLISHED
    - save: True

iptables-outgoing-eth0:
  iptables.append:
    - table: filter
    - chain: FORWARD
    - in-interface: eth0
    - out-interface: wlan0
    - jump: ACCEPT
    - save: True
