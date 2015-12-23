opensusedefault.packages:
  pkg.installed:
    - pkgs:
      - htop
      - git-core
      - zsh
      - man

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

root:
  user.present:
    - shell: /bin/zsh
    - require:
      - pkg: zsh

/home/ilmehtar/.zshrc
  file.managed:
    - source: salt://opensuse/zshrc-user
    - user: ilmehtar
    - group: users
    - require:
      - user: ilmehtar

/root/.zshrc
  file.managed:
    - source: salt://opensuse/zshrc-root
    - user: root
    - group: root
    - require:
      - user: root

ca-certificates-suse
  pkg.installed:
    - require:
      - file: /etc/zypp/repos.d/SUSE-CA.repo
