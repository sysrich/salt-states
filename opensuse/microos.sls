include:
  - opensuse

/etc/systemd/system/update-all-container-images.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://opensuse/update-all-container-images.timer
    - require:
      - file: /etc/systemd/system/update-all-container-images.service

update-all-container-images.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/update-all-container-images.timer

/etc/systemd/system/update-all-container-images.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://opensuse/update-all-container-images.service

