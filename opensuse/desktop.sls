{% from "macros.sls" import gsettings %}

desktop.packages:
  pkg.installed:
    - pkgs:
      - terminator
      - osc
      - dconf-editor

gedit-packages:
  pkg.installed:
    - pkgs:
      - gedit-plugins
      - gedit-plugin-bracketcompletion
      - gedit-plugin-code-assistance
      - gedit-plugin-codecomment
      - gedit-plugin-wordcompletion
      - gedit-plugin-drawspaces

# Gedit config
{{ gsettings("ilmehtar", "org.gnome.gedit.preferences.editor", "auto-indent", "true") }}
{{ gsettings("ilmehtar", "org.gnome.gedit.preferences.editor", "auto-save", "true") }}
{{ gsettings("ilmehtar", "org.gnome.gedit.preferences.editor", "bracket-matching", "true") }}
{{ gsettings("ilmehtar", "org.gnome.gedit.preferences.editor", "display-line-numbers", "true") }}
{{ gsettings("ilmehtar", "org.gnome.gedit.preferences.editor", "display-right-margin", "true") }}
{{ gsettings("ilmehtar", "org.gnome.gedit.preferences.editor", "highlight-current-line", "true") }}
{{ gsettings("ilmehtar", "org.gnome.gedit.preferences.editor", "insert-spaces", "true") }}
{{ gsettings("ilmehtar", "org.gnome.gedit.preferences.editor", "scheme", "cobalt") }}
{{ gsettings("ilmehtar", "org.gnome.gedit.preferences.editor", "tabs-size", "'uint32 2'") }}
{{ gsettings("ilmehtar", "org.gnome.gedit.preferences.editor", "wrap-last-split-mode", "word") }}

{{ gsettings("ilmehtar", "org.gnome.gedit.plugins", "active-plugins", "'['drawspaces', 'bracketcompletion', 'codecomment', 'wordcompletion', 'codeassistance', 'time', 'spell', 'sort', 'modelines', 'filebrowser', 'docinfo']'") }}
{{ gsettings("ilmehtar", "org.gnome.gedit.plugins.drawspaces", "draw-spaces", "'['space', 'tab', 'newline', 'nbsp', 'leading', 'trailing']") }}

# Shell config
{{ gsettings("ilmehtar", "org.gnome.shell.calendar", "show-weekdate", "true") }}
{{ gsettings("ilmehtar", "org.gnome.desktop.interface", "clock-show-date", "true") }}

# Nautilus config
{{ gsettings("ilmehtar", "org.gnome.nautilus.preferences", "default-folder-viewer", "list-view") }}

# Input settings
{{ gsettings("ilmehtar", "org.gnome.desktop.input-sources", "sources", "'[('xkb', 'gb'), ('xkb', 'de')]'") }}
{{ gsettings("ilmehtar", "org.gnome.desktop.input-sources", "xkb-options", "'['terminate:ctrl_alt_bksp']'") }}

