# CORD Project - vRouter
This repository provides a virtual scenario to explore the vRouter service of the CORD Project.

Demo scenario has been created using [Virtual Networks over linuX (VNX)](http://www.dit.upm.es/~vnx/).

Index:
- [Requirements](https://github.com/ralvarep/CORD-vRouter#requirements)
- [Scenario](https://github.com/ralvarep/CORD-vRouter#scenario)
- [Usage](https://github.com/ralvarep/CORD-vRouter#usage)
- [Notes](https://github.com/ralvarep/CORD-vRouter#notes)
- [Author](https://github.com/ralvarep/CORD-vRouter#author)
- [References](https://github.com/ralvarep/CORD-vRouter#references)


## Requirements

 - VNX installed [(VNX Installation Guide)](http://web.dit.upm.es/vnxwiki/index.php/Vnx-install)
 - Hard Drive: 3,5 GB avaible space (Filesystem size)
 - Memory: 4 GB RAM or more


## Scenario

![Scenario](https://raw.githubusercontent.com/ralvarep/CORD-vRouter/master/img/scenario.jpg)


## Usage

**STEP 1: Clone this repository**
~~~
$ git clone https://github.com/ralvarep/CORD-vRouter.git
~~~

**STEP 2: Build filesystem**

The virtual scenario has been configured using the filesystem in [copy-on-write (COW) mode](https://en.wikipedia.org/wiki/Copy-on-write). This allows you to use a single filesystem for all virtual machines, thereby optimizing the disk space occupied.
~~~
$ filesystems/create-rootfs
~~~
This step takes about 20-30 min. It will download all the necessary packages of the demo scenario.

**STEP 3: Create virtual scenario**
~~~
$ sudo vnx -f CORD-vRouter.xml -t
~~~
When the scenario is created, you can login to consoles with root:xxxx.

**STEP 4: Start ONOS (SDN Controller)**

Enter in the ONOS console and execute:
~~~
$ ok clean
$ onos-netcfg 127.0.0.1 /root/conf/vRouter_configuration.json
$ onos> app activate org.onosproject.vrouter
~~~
In this step ONOS will be launched to manage the OpenFlow switch of the topology setting the gateway of the AS 101 and speaking routing protocols with both R-internal (AS 101) and R-external (AS 102).

ONOS GUI is avaible from your host through [http://10.250.0.22:8181/onos/ui/login.html](http://10.250.0.22:8181/onos/ui/login.html). To login karaf:karaf.

**OTHER OPTIONS:**

* Launch terminal of some virtual machine
~~~
$ sudo vnx -f CORD-vRouter.xml --console -M VM-NAME
~~~
* Shutdown scenario
~~~
$ sudo vnx -f CORD-vRouter.xml --shutdown
~~~
* Start scenario that has previously been shutdown
~~~
$ sudo vnx -f CORD-vRouter.xml --start
~~~
* Destroy scenario
~~~
$ sudo vnx -f CORD-vRouter.xml -P
~~~


## Notes

* It has been used virbr0 network in this scenario, which is provided by default by libvirt.


## Author

This project has been developed by [Raúl Álvarez Pinilla](https://es.linkedin.com/in/raulalvarezpinilla).


## References

 *  [CORD Project](http://opencord.org/)
 *  [vRouter (PDF)](http://opencord.org/wp-content/uploads/2016/03/vRouter.pdf)
 *  [vRouter (Wiki)](https://wiki.onosproject.org/display/ONOS/vRouter)
 *  [Connecting the CORD POD to Upstream Networks](https://wiki.opencord.org/display/CORD/Connecting+the+POD+to+Upstream+Networks)
 *  [Quagga](http://www.nongnu.org/quagga/)

