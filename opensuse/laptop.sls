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

{% if grains['nodename'] == 'bb8.dyn.rootco.de' %}
kernel_HEAD:
  pkgrepo.managed:
    - humanname: Kernel HEAD
    - baseurl: http://download.opensuse.org/repositories/Kernel:/HEAD/standard/
    - gpgcheck: False
    - refresh: True

kernel-default:
  pkg.installed:
    - refresh: True
    - version: '>=4.14'
    - fromrepo: kernel_HEAD

/lib/firmware/brcm/brcmfmac4356-pcie.bin:
  file.managed:
    - source: salt://opensuse/brcmfmac4356-pcie.bin

/lib/firmware/brcm/brcmfmac4356-pcie.txt:
  file.managed:
    - source: salt://opensuse/brcmfmac4356-pcie.txt

/usr/share/alsa/ucm/chtrt5645/chtrt5645.conf:
  file.managed:
    - source: salt://opensuse/chtrt5645.conf

/usr/share/alsa/ucm/chtrt5645/HiFi.conf:
  file.managed:
    - source: salt://opensuse/HiFi.conf
{% endif %}
