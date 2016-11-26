/etc/zypp/zypp.conf:
  file.line:
    - mode: replace
    - match: "#solver.onlyRequires = false"
    - content: "solver.onlyRequires = true"
    - require_in:
      - pkg: myopensuse.packages
