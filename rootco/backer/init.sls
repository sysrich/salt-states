/root/.ssh/authorized_keys:
  file.managed:
    - user: root
    - mode: 600
    - makedirs: True
    - dirmode: 700
    - contents:
{% for host_key in salt ['mine.get']('*', 'backer_client_host_key').items() %}
      - no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding {{ host_key[1] }}
{% endfor %}

