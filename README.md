debian based live rescue system
===================================

Features
------------------------------------------

* direct boot into bash in under `10s`
* file system + disk utilities
* network utilities
* additional utilities
* localization via `/etc/default/locale` - default `en_US.UTF-8`
* keymap set via `/etc/default/keyboard` - default `de`
* loadable via PXE or usb storage
* x64 only (default)
* optional data storage on `/mnt/data` (mounted via partlabel "data")

Additional utilities/scripts
------------------------------------------

Location: [rootfs/usr/sbin](rootfs/usr/sbin)

### Media sanitization ##

#### hdd-erase ####

Execute a single run of `shred` to override the target device with random data

**Usage**

```bash
hdd-erase <device>
```

**Example**

```bash
hdd-erase /dev/sda
```

#### ssd-erase ####

Executes the `ATA SECURE ERASE` command on given device. 

Sets the drive password temporarily to `erase` to execute the secure erase procedure. In case the drive is already password protected you have to remove the passphrase or execute `hdparm --user-master u --security-erase erase` manually!

**Usage**

```bash
ssd-erase <device>
```

**Example**

```bash
ssd-erase /dev/sdb
```


#### cpsysimg ####

Write a gz compressed, gpt based disk image to block device

**Usage**

```bash
cpsysimg <file> <device>
```

**Example**

```bash
cpsysimg /mnt/data/boot.img.gz /dev/sdb
```

USB storage boot
----------------------------

### Partition layout ###

One storage partition contains the partlabel `system` to identify the system partition



### Extlinux Config ###

```
DEFAULT rescue-linux
  SAY Now booting the kernel from SYSLINUX...
LABEL rescue-linux
  KERNEL ../kernel.img
  APPEND root=PARTLABEL=system ro net.ifnames=0 biosdevname=0
  INITRD ../initramfs.img
```

License
----------------------------

**hypersolid** is OpenSource and licensed under the Terms of [GNU General Public Licence v2](LICENSE.txt). You're welcome to [contribute](CONTRIBUTE.md)!