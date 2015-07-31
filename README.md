# Muk

Creates a multiboot USB key

## Usage

* Find your device :

        $ fdisk -l

* Create a FAT32-formatted USB disk, without partitions:

        $ make init fs=sdb1

* Create a new partition, primary and bootable (using fdisk, cfdisk, or parted)

* Download iso :

        $ make iso

* Remove your USB device, and plug it back in. The auto-mounter on your OS should detect it now.

* Create the USB key :

        $ sudo mkdir /mnt/muk
        $ sudo mount /dev/sdb1 /mnt/muk
        $ sudo grub-install --force --no-floppy --boot-directory=/mnt/muk/boot /dev/sdb
        $ sudo cp -r grub /mnt/muk/boot/
        $ sudo rsync -auvzh --exclude '*.txt' --progress iso /mnt/muk/boot/
        $ sudo umount /mnt/muk

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
