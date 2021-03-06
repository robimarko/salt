en_US.UTF-8:
  locale.system

kernel.panic:
  sysctl.present:
    - value: 10

net.ipv4.ip_forward:
  sysctl.present:
    - value: 1

net.ipv6.conf.all.forwarding:
  sysctl.present:
    - value: 1

net.ipv6.conf.default.forwarding:
  sysctl.present:
    - value: 1

net.ipv4.conf.all.send_redirects:
  sysctl.present:
    - value: 0

net.ipv4.conf.all.rp_filter:
  sysctl.present:
    - value: 0

net.ipv4.conf.default.send_redirects:
  sysctl.present:
    - value: 0

net.ipv4.conf.default.rp_filter:
  sysctl.present:
    - value: 0

sysfsutils:
  pkg.latest:
    - refresh: True
  service.running:
    - require:
      - pkg: sysfsutils

htop:
  pkg.latest:
    - refresh: True

iotop:
  pkg.latest:
    - refresh: True

sysstat:
  pkg.latest:
    - refresh: True

iptraf:
  pkg.latest:
    - refresh: True

tcpdump:
  pkg.latest:
    - refresh: True

python-gnupg:
  pkg.latest:
    - refresh: True
    - reload_modules: True

python-apt:
  pkg.latest:
    - refresh: True

inputrc-history:
  file.blockreplace:
    - name: /etc/inputrc
    - marker_start: "# START inputrc-history GENERATED BY SALT. DO NOT EDIT."
    - marker_end: "# END inputrc-history"
    - content: |
        "\e[5~": history-search-backward
        "\e[6~": history-search-forward
    - append_if_not_found: True

include:
  - .firewall
  - .ssh
  - .ntp
  - .screen
  - .vim
  - .upgrades
  - .debsums
  - .msgpack
