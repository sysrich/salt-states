devel_languages_ruby_extensions:
  pkgrepo.managed:
    - humanname: Ruby Extensions (openSUSE_Leap_42.1)
    - baseurl: http://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/openSUSE_Leap_42.1/
    - gpgcheck: 1
    - gpgkey: http://download.opensuse.org/repositories/devel:/languages:/ruby:/extensions/openSUSE_Leap_42.1//repodata/repomd.xml.key
    - autorefresh: 1

ruby2.1-rubygem-jekyll:
  pkg.installed:
    - fromrepo: devel_languages_ruby_extensions

rootco.de-web:
  git.latest:
    - name: https://github.com/sysrich/rootco.de-web.git
    - target: /srv/www/
    - require:
      - pkg: ruby2.1-rubygem-jekyll
