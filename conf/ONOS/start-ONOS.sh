#!/bin/bash

# Load bashrc
PS1='$ ' . ~/.bashrc

cd $KARAF_ROOT; ./bin/start

# Activate manually vRouter app (Karaf console)
# app activate org.onosproject.vrouter

# Deactivate manually vRouter app (Karaf console)
# app deactivate org.onosproject.vrouter

# Upload network configuration
# onos-netcfg 127.0.0.1 /root/conf/network-cfg.json
