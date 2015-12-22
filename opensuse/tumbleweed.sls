suse-ca-repo:
  cmd.run:
    - name: zypper ar -f https://imap.suse.de/repo/openSUSE_Tumbleweed/ SUSE-CA
    - creates: /etc/zypp/repos.d/SUSE-CA.repo
