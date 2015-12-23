opensuse.packages:
  pkg.installed:
    - pkgs:
      - terminator
      - htop
      - git-core
      - osc
      - zsh

git-zsh-users-history-substring-search
  git.latest:
    - name: https://github.com/zsh-users/zsh-history-substring-search.git
    - target: /opt/zsh-users/zsh-history-substring-search
    - require:
      - pkg: git-core

git-zsh-users-history-syntax-highlighting
  git.latest:
    - name: https://github.com/zsh-users/zsh-syntax-highlighting.git
    - target: /opt/zsh-users/zsh-syntax-highlighting
    - require:
      - pkg: git-core

git-zsh-users-autosuggestions
  git.latest:
    - name: https://github.com/tarruda/zsh-autosuggestions.git
    - target: /opt/zsh-users/zsh-autosuggestions
    - require:
      - pkg: git-core

ilmehtar:
  user.present:
    - fullname: Richard Brown
    - shell: /bin/zsh
    - home: /home/ilmehtar
    - require:
       - pkg: zsh

/home/ilmehtar/.zshrc
  file.managed:
    - source: salt://opensuse/zshrc-user
    - user: ilmehtar
    - group: users
    - require:
      - user: ilmehtar

ca-certificates-suse
  pkg.installed:
    - require:
      - file: /etc/zypp/repos.d/SUSE-CA.repo

gedit-packages:
  pkg.installed:
    - pkgs:
      - gedit-plugins
      - gedit-plugin-bracketcompletion
      - gedit-plugin-code-assistance
      - gedit-plugin-codecomment
      - gedit-plugin-wordcompletion
      - gedit-plugin-drawspaces

gedit-config:
  cmd.wait:
    - name: /usr/bin/dconf load /org/gnome/gedit/ < /tmp/gedit-conf.dconf
    - user: ilmehtar
    - watch:
      - pkg: gedit-packages
    - require:
      - user: ilmehtar
  file.managed:
    - name: /tmp/gedit-conf.dconf
    - source: salt://opensuse/gedit-conf.dconf
