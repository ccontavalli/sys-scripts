What is this?
=============

This git repository contains a set of system scripts and utilities commonly
uset to maintain Debian GNU/Linux systems. Some of the scripts are used to
setup firewalling, encrypted partitions, or to regularly perform maintenances
through cron jobs.

Scripts are grouped by what they are used for, read the next few sections to
know more.

Note also that most of the scripts are fairly well self documented.
To read the documentation, either open the script in your editor, or run
`perldoc /path/to/scriptname`. You must have the package `perldoc` installed on
your system (`apt-get install perl-doc`).


Managing encrypted volumes
==========================

Let's say you have a linux server in a remote datacenter and you want to
keep all of your users data encrypted, while still maintaining the ability
to reboot the system without being there, a common solution is to:

1. Have an encrypted root that can boot without manual interactions. From
   this root, start ssh and only basic services.
2. When the system reboots, connect via ssh, mount the encrypted volumes
   and continue the boot process.

There are several ways to achieve this. In this repository, you can find:

   * [ac-dmcrypt-manage](docs/README.ac-dmcrypt-manage)

     It allows you to manage, mount, and unmount encrypted volumes by
     storing keys on an encrypted partition, and using a single passphrase
     to access keys. Use this tool to setup encrypted partitions.

   * [ac-system-boot](docs/README.ac-system-boot)

     It allows you to mount encrypted partitions and restart services
     with a single command. It is handy if you keep, for example, your
     mysql or http data encrypted. In this case, you want to not start
     mysql (or apache) until the necessary partitions are mounted.
     By invoking ac-system-boot, your encrypted partitions will be started
     and the systems that depend on them will be restarted.

How to use the two scripts:

1. Create a set of encrypted volumes using `ac-dmcrypt-manage create-volume`.
   You can now mount them by using `ac-dmcrypt-manage start`.

2. If you have services running on your system that depend on those volumes,
   run `ac-system-boot add servicename`, where `servicename` is the name of
   the service you would use with `/etc/init.d/servicename restart` or
   `service servicename restart`.

3. Next time your system is rebooted, the encrypted partitions and those
   services will not start automatically. All you have to do is run
   `ac-system-boot start`. It will mount the encrypted partitions, and
   start all the services.


Other utility scripts
=====================

   * [ac-system-backup](docs/README.ac-system-backup)

     Trivial rsync wrapper to pass all the normal options you should use to
     backup an entire remote system.

   * [lsc](docs/README.lsc)

     Small interpreter to save typing on firewalling, traffic shaping, and
     many other kinds of scripts.


LICENSE
=======

Unless otherwise specified, the code in this repository is distributed under
the terms of the Gnu Public License v2.0, as available here:
http://www.gnu.org/licenses/gpl-2.0.html.
