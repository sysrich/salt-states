include:
  - opensuse

/etc/zypp/zypp.conf:
  file.line:
    - mode: replace
    - match: "# solver.onlyRequires = false"
    - content: "solver.onlyRequires = true"
    - require_in:
      - pkg: myopensuse.packages

{% if salt['grains.get']('productname', 'none') == 'rpi' %}
mypijeos.packages:
  pkg.installed:
    - pkgs:
      - crda
      - wireless-regdb
    - require:
      - pkg: myopensuse.packages
{% endif %}
