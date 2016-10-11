#!/bin/bash

# Load bashrc
PS1='$ ' . ~/.bashrc

echo 'ONOS_APPS=drivers,openflow,proxyarp,mobility,fwd,vrouter' >> ~/.bashrc
export ONOS_APPS=drivers,openflow,proxyarp,mobility,fwd,vrouter
~/onos/tools/dev/bin/onos-setup-karaf clean
cp ~/conf/network-cfg.json $KARAF_ROOT/../config/
