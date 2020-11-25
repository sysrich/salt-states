include:
  - opensuse.desktop

laptop.packages:
  pkg.installed:
    - pkgs:
      - tlp
      - powertop
#      - iio-sensor-proxy
      - bbswitch
      - patterns-desktop-mobile
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

{% if grains['nodename'] == 'oldbb8.dyn.rootco.de' %}

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

/etc/pulse/default.pa:
  file.append:
    - text:
      - set-card-profile alsa_card.platform-cht-bsw-rt5645 HiFi
      - set-default-sink alsa_output.platform-cht-bsw-rt5645.HiFi__hw_chtrt5645__sink
      - set-sink-port alsa_output.platform-cht-bsw-rt5645.HiFi__hw_chtrt5645__sink [Out] Speaker

/etc/pulse/daemon.conf:
  file.append:
    - text:
      - realtime-scheduling = no
{% endif %}
