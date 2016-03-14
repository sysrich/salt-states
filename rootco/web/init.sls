rootco.de-web:
  git.latest:
    - name: https://github.com/sysrich/rootco.de-web.git
    - target: /srv/www/
    - require:
      - gem: jekyll
