backerclient:
  user.present:
    - fullname: Backer Client User
    - shell: /bin/false
    - home: /home/backerclient
    - createhome: True
    - groups:
      - wheel

ssh-keygen -N "" -f /home/backerclient/.ssh/id_rsa:
  cmd.run:
    - creates: /home/backerclient/.ssh/id_rsa

