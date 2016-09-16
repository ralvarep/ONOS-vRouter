#!/bin/bash

chmod a+w /var/run
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
zebra -d
ospfd -d
