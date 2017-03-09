myopensuse.packages:
  pkg.installed:
    - pkgs:
      - htop
      - screen
      - git-core
      - zsh
      - csync
      - libcsync-plugin-sftp
      - command-not-found
      - salt-zsh-completion

git-zsh-users-history-substring-search:
  git.latest:
    - name: https://github.com/zsh-users/zsh-history-substring-search.git
    - target: /opt/zsh-users/zsh-history-substring-search
    - force_reset: True
    - require:
      - pkg: myopensuse.packages

git-zsh-users-history-syntax-highlighting:
  git.latest:
    - name: https://github.com/zsh-users/zsh-syntax-highlighting.git
    - target: /opt/zsh-users/zsh-syntax-highlighting
    - require:
      - pkg: myopensuse.packages

git-zsh-users-autosuggestions:
  git.latest:
    - name: https://github.com/tarruda/zsh-autosuggestions.git
    - target: /opt/zsh-users/zsh-autosuggestions
    - require:
      - pkg: myopensuse.packages

ilmehtar:
  user.present:
    - fullname: Richard Brown
    - shell: /bin/zsh
    - home: /home/ilmehtar
    - require:
       - pkg: myopensuse.packages

root:
  user.present:
    - shell: /bin/zsh
    - require:
      - pkg: myopensuse.packages

/home/ilmehtar/.ssh/config:
  file.managed:
    - user: ilmehtar
    - group: users
    - mode: 600
    - makedirs: True
    - contents:
      - Host rootco.de
      - Port 8282
      - Host bb8.rootco.de
      - Port 8282
    - require:
      - user: ilmehtar

/home/ilmehtar/.zshrc:
  file.managed:
    - source: salt://opensuse/zshrc-user
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

