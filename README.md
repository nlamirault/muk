# Muk

[![License Apache 2][badge-license]][LICENSE][]
![Version][badge-release]

![Muk](https://github.com/nlamirault/muk/raw/master/muk.png "Muk")

Creates a multiboot USB key

![0.1.0](https://github.com/nlamirault/muk/raw/master/muk-0.1.0.png "0.1.0")


## Usage

* Find your device :

        $ fdisk -l

* Create a FAT32-formatted USB disk, without partitions:

        $ make init fs=sdb1

* Create a new partition, primary and bootable (using `fdisk`, `cfdisk`, or `parted`)

* Download iso :

        $ make iso

* Remove your USB device, and plug it back in. The auto-mounter on your OS should detect it now.

* Create the USB key using the device (like `/dev/sdb1`) and the mount directory:

        $ sudo bin/build.sh /run/media/userMUK1 sdb

* Umount the USB device.


## Development

* Test the USB key using QEmu:

        $ sudo make test device=/dev/sdb


## Create the key :

    mkdir -p /run/media/nlamirault/MUK/boot/
    sudo grub-install --target=i386-pc --recheck --boot-directory=/run/media/nlamirault/MUK/boot /dev/sdb



## Test

You could test your USB

    $ sudo qemu-system-x86_64 -hda /dev/sdb

You could test downloaded iso :

    $ qemu-system-x86_64 -cdrom iso/ArchAssault-openbox-2015.05.25-x86_64.iso -m 1024


## License

See [LICENSE][] for the complete license.


## Changelog

A changelog is available [here](ChangeLog.md).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>


[LICENSE]: https://github.com/nlamirault/muk/blob/master/LICENSE

[badge-license]: https://img.shields.io/badge/license-Apache_2-green.svg
[badge-release]: https://img.shields.io/github/release/nlamirault/muk.svg
