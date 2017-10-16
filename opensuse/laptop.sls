include:
  - opensuse.desktop

laptop.packages:
  pkg.installed:
    - pkgs:
      - tlp
      - powertop
#      - iio-sensor-proxy
      - bbswitch
      - patterns-desktop-laptop
    - require:
      - pkg: gedit-packages

# no longer own a laptop with a light sensor
#iio-sensor-proxy:
#  service.running:
#    - enable: True
#    - require:
#      - pkg: laptop.packages

tlp:
  service.running:
    - enable: True
    - require:
      - pkg: laptop.packages

tlp-sleep:
  service.enabled:
    - require:
      - pkg: laptop.packages

/etc/modprobe.d/49-disablenouveau.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents:
      - blacklist nouveau
    - require:
      - pkg: laptop.packages

/sbin/mkinitrd -f:
  cmd.wait:
    - watch:
      - file: /etc/modprobe.d/49-disablenouveau.conf
