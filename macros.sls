# Configure a gsettings key for GNOME 3 desktop
{% macro gsettings(user, path, key, value) -%}
DISPLAY=:0 gsettings set {{ path }} {{ key }} {{ value }}:
  cmd.run:
    - cwd: /
    - user: {{ user }}
    - unless: gsettings get {{ path }} {{ key }} | grep {{ value }}
{%- endmacro %}
