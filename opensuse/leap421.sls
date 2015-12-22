suse-ca-repo:
  cmd.run:
    - name: zypper ar -f https://imap.suse.de/repo/openSUSE_Leap_42.1/ SUSE-CA
    - creates: /etc/zypp/repos.d/SUSE-CA.repo
