#!/bin/bash

ovs-vsctl add-br ovs
ovs-vsctl add-port ovs eth1
ovs-vsctl add-port ovs eth2
ovs-vsctl add-port ovs eth3
ovs-vsctl set bridge ovs other-config:hwaddr=00:00:00:00:00:01
ovs-vsctl set bridge ovs protocols=OpenFlow13
ovs-vsctl set-controller ovs tcp:10.1.11.2:6633
