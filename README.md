What is this?
=============

This git repository contains a set of system scripts we use often to configure
Debian / Linux systems. It has utilities used to configure firewalling, mount
encrypted partitions after boot, or maintenance cron jobs.

Scripts are grouped by what they are used for, read the next few sections to
know more.

Note also that most of the scripts are fairly well self documented.
To read the documentation, either open the script in your editor, or run
`perldoc /path/to/scriptname`. You must have the package `perldoc` installed on
your system (`apt-get install perl-doc`).


Managing encrypted volumes
==========================

Let's say you have a linux server in a remote datacenter. Let's say you want
to be able to reboot this server easily, while still keeping all your data
encrypted. A common way to achieve this is to:

1. Have an encrypted root that can boot without manual interactions. From
   this root, start ssh and only basic services.
2. When the system reboots, connect via ssh, mount the encrypted volumes
   and continue the boot process.

There are several ways to achieve this. In this repository, you can find:

   * [ac-dmcrypt-manage](README.ac-dmcrypt-manage)

     It allows you to enter a single passphrase to decrypt a volume containing
     a set of keys and mount all the volumes described in a fstab style file.

   * *ac-system-boot*

     It will invoke `ac-dmcrypt-manage` and continue the boot process by
     (re-)starting a list of daemons you provided.


Other utility scripts
=====================

*ac-system-backup*, trivial rsync wrapper to pass all the normal options you
should use to backup an entire remote system.


LICENSE
=======

Unless otherwise specified, the code in this repository is distributed under
the terms of the Gnu Public License v2.0, as available here:
http://www.gnu.org/licenses/gpl-2.0.html.
