/etc/ssh/sshd_config:
  file.managed:
    - source: salt://sshd/sshd_config

sshd:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/ssh/sshd_config

? AAAAB3NzaC1yc2EAAAADAQABAAACAQDUpkI6oEETQqU6czrvNBGwRFI4bIURGJiYKJWCpkYnK/lxBdv0sF43Npy5f+0kNAZppnKClC93heeMxwykrI8tz8HYiSx29tgLnh9B7n+HneAd5zeZuIlPFrvs9tBo3W4JmA/0PJZ+CRrWxgxMrIXZO8h9h6Ktj3kR3zpvEMtK6zOMckknzf6gGDF9Re/3QvtJVIS3A7mMyH8tiIT7qH6u9PpmXzeL3hiFJicg4aCuB5ntS48pbytcbbnL1ebUhX7SNCtnjx/fyTHF5CpDTjyaLsl4aqS9HjNjLibVcyld7YmP4phDDhySB/SOE3rAmVzJ1K/aXjh2RtoQ/g+6QfJUs5rs7IM23UVekdLeDKW13Ab0fGxPvxIGIqpsHm3Yco0j6oGW0vOSbJpDkDuVf19oWxS82zbbUz2kf3B5236bWg7mj0XNdiYUJl/gHVlRdQ9+WRMV6FZQS2okB6lNbq3La+dOWicsTC1xs8zHNA45kdEfQpw+fyE8WSUwEbENsYU5x4edlR6iMuchg6D+4sBUSsP23Aipg18BHTuumIp4Wzhu/ClWD5GrDWWufY1ZnKtuaD7n6qcMTx+FdwR0g4I5CQlqKAihxUW/frtuXYPRUEWwRWcoAwADJgo0gzJXbbGYp2yzQBl8uYXAO+gYoZusE/3+i3YGIJ8b1GFs1FSrQQ==
:
  ssh_auth.present:
    - user: ilmehtar
    - enc: ssh-rsa
    - comment: ilmehtar@rootco.de

? AAAAB3NzaC1yc2EAAAADAQABAAABAQClgRngpbnTfNq18oTGhPQValEi1PEUB0FuTHzKhvliJOkbB0PYc0m2Y3AtAkGwFOksAitZSzECNIWlQS3uYYNky2yNuIBzfzyFaY0dmMJZo3TFvgvPxVak2+sLH2CLcxThPvLYI28Dgz6DnyJjTlqvetyfcoaW/lNOAW+KPg65hOgnpmk40QO5l3Tnuc0UDm2dMzFMVs1+nKaVEBvAN1kCm665kIJhK23fBDBbujbPK64nHDDEdcUDvmJzSDUb0DWbNyBe4lMsJvAhkqKQu/KsYNwhOYOmD6L+TPzpnoDuQTyU/ShmMGubplH5mM/uanMRyU3MyQrWQnW7pWdMMzrB
:
  ssh_auth.present:
    - user: ilmehtar
    - enc: ssh-rsa
    - comment: ilmehtar@obiwan.local.rootco.de
