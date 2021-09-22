#!/bin/sh
podman run --rm registry.opensuse.org/home/rbrownsuse/containers/containers/iperf:latest /usr/bin/iperf3 -b 1000M -R -P 10 -t 1 -c d0.rootco.de | grep "\[SUM\]" | grep receiver | awk '{print $6}' > /disk/nextcloud/dlbw.css
