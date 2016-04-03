git:
  user.present:
    - fullname: git User
    - shell: /usr/bin/git-shell
    - home: /srv/git
    - createhome: False
    - require:
      - pkg: myopensuse.packages

/srv/git/git-shell-commands:
  file.directory:
    - user: git
    - group: users
    - dir_mode: 700
    - file_mode: 700
    - require:
      - user: git

/srv/git/git-shell-commands/no-interactive-login:
  file.managed:
    - user: git
    - source: salt://rootco/git/no-interactive-login
    - mode: 700
    - require:
      - file: /srv/git/git-shell-commands

git-ssh-keys:
  ssh_auth.present:
    - user: git
    - source: salt://sshd/keys.id_rsa.pub
