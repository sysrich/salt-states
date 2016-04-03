git:
  user.present:
    - fullname: git User
    - shell: /usr/bin/git-shell
    - home: /srv/git
    - createhome: False
    - require:
      - pkg: myopensuse.packages

/srv/git:
  file.directory:
    - user: git
    - group: users
    - require:
      - user: git

/srv/git-priv:
  file.directory:
    - user: git
    - group: users
    - require:
      - user: git

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

/srv/git-priv/todo.git:
  git.present:
    - user: git
    - require:
      - file: /srv/git-priv

git-ssh-keys:
  ssh_auth.present:
    - user: git
    - names:
      - AAAAB3NzaC1yc2EAAAADAQABAAACAQDUpkI6oEETQqU6czrvNBGwRFI4bIURGJiYKJWCpkYnK/lxBdv0sF43Npy5f+0kNAZppnKClC93heeMxwykrI8tz8HYiSx29tgLnh9B7n+HneAd5zeZuIlPFrvs9tBo3W4JmA/0PJZ+CRrWxgxMrIXZO8h9h6Ktj3kR3zpvEMtK6zOMckknzf6gGDF9Re/3QvtJVIS3A7mMyH8tiIT7qH6u9PpmXzeL3hiFJicg4aCuB5ntS48pbytcbbnL1ebUhX7SNCtnjx/fyTHF5CpDTjyaLsl4aqS9HjNjLibVcyld7YmP4phDDhySB/SOE3rAmVzJ1K/aXjh2RtoQ/g+6QfJUs5rs7IM23UVekdLeDKW13Ab0fGxPvxIGIqpsHm3Yco0j6oGW0vOSbJpDkDuVf19oWxS82zbbUz2kf3B5236bWg7mj0XNdiYUJl/gHVlRdQ9+WRMV6FZQS2okB6lNbq3La+dOWicsTC1xs8zHNA45kdEfQpw+fyE8WSUwEbENsYU5x4edlR6iMuchg6D+4sBUSsP23Aipg18BHTuumIp4Wzhu/ClWD5GrDWWufY1ZnKtuaD7n6qcMTx+FdwR0g4I5CQlqKAihxUW/frtuXYPRUEWwRWcoAwADJgo0gzJXbbGYp2yzQBl8uYXAO+gYoZusE/3+i3YGIJ8b1GFs1FSrQQ==
    - enc: ssh-rsa
    - comment: ilmehtar@rootco.de
