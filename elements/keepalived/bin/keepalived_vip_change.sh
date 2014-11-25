#!/bin/bash

# A simple script triggered by keepalived when VIPs are moved
# around. When VIPs are moved to this node, explicit route for
# each VIP is added - this assures that any connection to VIP
# will use by default local-ipv4 as source address. Without this
# explicit route VIP address is used which causes issues when VIP
# moved to another node.
# https://bugs.launchpad.net/tripleo/+bug/1376200
#
# When VIP is moved from this node, this explicit route is removed
# to allow proper routing from this node to new VIP node.

set -eu

logger "Started $0 $@"
PATH="$PATH:/bin:/sbin"
LOCAL_IP=$(os-apply-config --key local-ipv4 --type netaddress)

if [ "$3" = "MASTER" ]; then
    for ip in $(cat /etc/keepalived/virtual_ips); do
        logger "adding explicit route for $ip"
        ip ro replace local $ip dev lo src $LOCAL_IP
    done
else
    for ip in $(cat /etc/keepalived/virtual_ips); do
        logger "removing explicit route for $ip"
        ip ro del local $ip
    done
fi
