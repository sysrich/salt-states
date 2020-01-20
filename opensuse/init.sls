include:
  - rootco.backer.client

root:
  user.present

ilmehtar:
  user.present:
    - fullname: Richard Brown
    - home: /home/ilmehtar

/home/ilmehtar/.ssh/config:
  file.managed:
    - user: ilmehtar
    - group: users
    - mode: 600
    - makedirs: True
    - contents:
      - Host openqa.opensuse.org
      - HostName proxy-opensuse.suse.de
      - Port 2215
      - Host rootco.de
      - Port 8282
      - Host d0.rootco.de
      - Port 8282
      - Host cloud.dyn.rootco.de
      - Port 80
      - Host nc.rootco.de
      - Port 8282
      - Host r2d2.home.rootco.de
      - Port 8282
      - ProxyCommand ssh ilmehtar@cloud.dyn.rootco.de -W 192.168.1.3:%p #workaround magic firewalling in jumphost
      - Host c3po.home.rootco.de
      - Port 22
      - ProxyCommand ssh ilmehtar@cloud.dyn.rootco.de -W %h:%p
    - require:
      - user: ilmehtar

/home/ilmehtar/.zshrc:
  file.managed:
    - source: salt://opensuse/zshrc-user
    - user: ilmehtar
    - group: users
    - require:
      - user: ilmehtar

/home/ilmehtar/.zprofile:
  file.managed:
    - source: salt://opensuse/zprofile
    - user: ilmehtar
    - group: users
    - require:
      - user: ilmehtar

/root/.zshrc:
  file.managed:
    - source: salt://opensuse/zshrc-root
    - user: root
    - group: root
    - require:
      - user: root

/etc/sudoers.d/ilmehtar:
  file.managed:
    - mode: 600
    - contents:
      - 'ilmehtar ALL=(ALL) NOPASSWD: ALL'
    - require:
      - user: ilmehtar

{% if salt['grains.get']('productname', 'none') == 'rpi' %}
/etc/dracut.conf.d/raspberrypi_modules.conf:
  file.line:
    - mode: replace
    - match: '#omit_drivers+=" sdhci-iproc"'
    - content: 'omit_drivers+=" sdhci-iproc"'

/sbin/mkinitrd -f:
  cmd.wait:
    - watch:
      - file: /etc/dracut.conf.d/raspberrypi_modules.conf
{% endif %}

