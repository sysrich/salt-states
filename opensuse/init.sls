myopensuse.packages:
  pkg.installed:
    - pkgs:
      - htop
      - git-core
      - zsh
      - command-not-found
      - salt-zsh-completion
      - man

git-zsh-users-history-substring-search:
  git.latest:
    - name: https://github.com/zsh-users/zsh-history-substring-search.git
    - target: /opt/zsh-users/zsh-history-substring-search
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