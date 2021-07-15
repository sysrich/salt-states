include:
  - opensuse

myopensuse.packages:
  pkg.installed:
    - pkgs:
      - htop
      - screen
      - git-core
      - zsh
      - csync
      - libcsync-plugin-sftp
      - scout-command-not-found
      - salt-zsh-completion
      - no-more-secrets
      - screenfetch

git-zsh-users-history-substring-search:
  git.latest:
    - name: https://github.com/zsh-users/zsh-history-substring-search.git
    - target: /opt/zsh-users/zsh-history-substring-search
    - force_reset: True
    - require:
      - pkg: myopensuse.packages

git-zsh-users-history-syntax-highlighting:
  git.latest:
    - name: https://github.com/zsh-users/zsh-syntax-highlighting.git
    - target: /opt/zsh-users/zsh-syntax-highlighting
    - force_fetch: True
    - require:
      - pkg: myopensuse.packages

git-zsh-users-autosuggestions:
  git.latest:
    - name: https://github.com/tarruda/zsh-autosuggestions.git
    - rev: v0.4.0
    - force_reset: True
    - target: /opt/zsh-users/zsh-autosuggestions
    - require:
      - pkg: myopensuse.packages

# TODO: Above is formerly from opensuse/init.sls, tidy up and merge better with below, the original common.sls states

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

bundler:
  gem.installed:
    - user: root
    - require:
      - gem: jekyll
