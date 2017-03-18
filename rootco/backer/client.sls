backerclient:
  user.present:
    - fullname: Backer Client User
    - shell: /bin/false
    - home: /home/backerclient
    - createhome: True
    - groups:
      - wheel

/home/backerclient/.ssh/:
  file.directory:
    - user: backerclient
    - group: users
    - mode: 700
    - require:
      - user: backerclient

ssh-keygen -N "" -f /home/backerclient/.ssh/id_rsa:
  cmd.run:
    - creates: /home/backerclient/.ssh/id_rsa

