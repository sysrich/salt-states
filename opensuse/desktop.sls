include:
  - opensuse.common
  
desktop-packages:
  pkg.installed:
    - pkgs:
      - terminator
      - python-notify
      - osc
      - dconf-editor
      - gnome-boxes
      - mumble
      - hexchat
      - virt-manager
      - qemu-ovmf-x86_64
      - chromium
      - gnome-builder
    - require:
      - pkg: mycommonopensuse.packages

{% if 'Tumbleweed' in grains['oscodename'] %}
{% set opensuserepopath = "openSUSE_Tumbleweed" %}
{% elif 'Leap' in grains['oscodename'] %}
{% set opensuserepopath = "openSUSE_Leap_{{ grains['osrelease'] }}" %}
{% else %}
{% set opensuserepopath = "openSUSE_{{ grains['osrelease'] }}" %}
{% endif %}

packman-repo:
  pkgrepo.managed:
    - humanname: Packman Essentials - {{ opensuserepopath }}
    - baseurl: http://ftp.gwdg.de/pub/linux/misc/packman/suse/{{ opensuserepopath }}/Essentials/
    - refresh: True
    - gpgcheck: False
    - require:
      - pkg: mycommonopensuse.packages

packman-packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - gstreamer-plugins-bad-orig-addon
      - gstreamer-plugins-ugly-orig-addon
      - gstreamer-plugins-libav
      - gstreamer-plugins-vaapi
      # Camera requires exfat
      - exfat-utils
      - fuse-exfat
    - fromrepo: packman-repo
    - require:
      - pkg: desktop-packages

gedit-packages:
  pkg.installed:
    - pkgs:
      - gedit-plugins
      - gedit-plugin-code-assistance
      - gedit-plugin-codecomment
      - gedit-plugin-wordcompletion
      - gedit-plugin-drawspaces
    - require:
      - pkg: packman-packages

dconf-defaults:
  file.managed:
    - name: /home/ilmehtar/.defaultsettings.dconf
    - source: salt://opensuse/settings.dconf
    - template: jinja
    - user: ilmehtar
    - group: users
    - require:
      - user: ilmehtar
      - pkg: gedit-packages

autostart-script:
  file.managed:
    - name: /home/ilmehtar/.autostart.sh
    - source: salt://opensuse/autostart.sh
    - mode: 744
    - user: ilmehtar
    - group: users
    - require:
      - file: dconf-defaults

autostart-desktop:
  file.managed:
    - name: /home/ilmehtar/.config/autostart/startup.desktop
    - source: salt://opensuse/startup.desktop
    - mode: 744
    - user: ilmehtar
    - group: users
    - makedirs : true
    - require:
      - file: autostart-script
      - file: terminator-config

terminator-config:
  file.managed:
    - name: /home/ilmehtar/.config/terminator/config
    - source: salt://opensuse/terminator-config
    - makedirs: true
    - user: ilmehtar
    - group: users
    - require:
      - user: ilmehtar
      - pkg: desktop-packages

libvirtd:
  service.running:
    - enable: True
    - require:
      - pkg: desktop-packages

/home/ilmehtar/Code/gh/sysrich:
  file.directory:
    - user: ilmehtar
    - group: users
    - makedirs: true
    - require:
      - user: ilmehtar

/home/ilmehtar/Code/gh/openSUSE:
  file.directory:
    - user: ilmehtar
    - group: users
    - makedirs: true
    - require:
      - user: ilmehtar

/home/ilmehtar/Code/grd:
  file.directory:
    - user: ilmehtar
    - group: users
    - makedirs: true
    - require:
      - user: ilmehtar

/home/ilmehtar/Code/gsd:
  file.directory:
    - user: ilmehtar
    - group: users
    - makedirs: true
    - require:
      - user: ilmehtar

/home/ilmehtar/Code/boo:
  file.directory:
    - user: ilmehtar
    - group: users
    - makedirs: true
    - require:
      - user: ilmehtar

/home/ilmehtar/Code/bsd:
  file.directory:
    - user: ilmehtar
    - group: users
    - makedirs: true
    - require:
      - user: ilmehtar
