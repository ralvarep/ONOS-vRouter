#!/bin/bash

sleep 5

ifconfig eth1 down
ifconfig eth1 hw ether 00:00:00:00:00:01
ip address add 10.0.0.1/24 dev eth1
ip address add 10.1.1.1/24 dev eth1
ip address add 2001:db8::1/64 dev eth1
ip address add 2001:db8:1:1::1/64 dev eth1
ifconfig eth1 up

chmod a+w /var/run
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
zebra -d
bgpd -d
ospfd -d
