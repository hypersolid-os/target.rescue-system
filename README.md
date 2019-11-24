debian based live rescue system
===================================


## Extlinux Config ##

```
DEFAULT rescue-linux
  SAY Now booting the kernel from SYSLINUX...
LABEL rescue-linux
  KERNEL ../kernel.img
  APPEND root=PARTUUID=927c0d1c-5f20-46d3-83b7-e3d3501e7e19 ro net.ifnames=0 biosdevname=0
  INITRD ../initramfs.img
```