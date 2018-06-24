mycommonopensuse.packages:
  pkg.installed:
    - pkgs:
      - man
      - ruby-devel # needed for jekyll
      - make # needed for jekyll
      - gcc # needed for jekyll
      - gcc-c++ # needled for jekyll
      - autoconf # needed for jekyll
    - require:
      - pkg: myopensuse.packages

jekyll:
  gem.installed:
    - user: root
    - require:
      - pkg: mycommonopensuse.packages

jekyll-paginate:
  gem.installed:
    - user: root
    - require:
      - gem: jekyll

redcarpet:
  gem.installed:
    - user: root
    - require:
      - gem: jekyll
