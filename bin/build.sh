#!/bin/bash

# Copyright (C) 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

NO_COLOR="\033[0m"
OK_COLOR="\033[32;01m"
ERROR_COLOR="\033[31;01m"
WARN_COLOR="\033[33;01m"


if [ -z "$1" ]; then
    echo -e "${ERROR_COLOR}[muk] device mount directory missing.${NO_COLOR}"
    echo -e "Usage:\t $0 /mnt sdb1 ${NO_COLOR}"
    exit 1
fi

if [ -z "$2" ]; then
    echo -e "${ERROR_COLOR}[muk] device parameter missing.${NO_COLOR}"
    echo -e "Usage:\t $0 /mnt sdb1 ${NO_COLOR}"
    exit 1
fi

DIR=`pwd`

ISO="${DIR}/iso"
GRUB="${DIR}/grub"

MOUNT=$1
DEV=$2

echo -e "${OK_COLOR}[muk] Build using ${MOUNT} ${DEV}${NO_COLOR}"

# echo -e "${OK_COLOR}[muk] Initialize directories${NO_COLOR}"
# sudo mkdir -p ${MOUNT}/boot/iso

# echo -e "${OK_COLOR}[muk] Install GRUB${NO_COLOR}"
# sudo grub-install --force --no-floppy --boot-directory=/run/media/nlamirault/MUK/boot /dev/sdb


# # sudo grub-install --directory=/usr/lib/grub/i386-pc --boot-directory=${MOUNT}/boot/ /dev/${DEV}
# # # sudo grub-install --force --no-floppy --boot-directory=${MOUNT}/boot ${DEV}
# # # sudo grub-install --removable --no-floppy --target x86_64-efi --boot-directory=${MOUNT}/boot ${DEV}
# # # grub2-install --directory=/usr/lib/grub/i386-pc --boot-directory=${USBMNT:-/mnt}/boot /dev/${USBDEV}


# # echo -e "${OK_COLOR}[muk] Install Boot options${NO_COLOR}"
# # sudo cp -r ${GRUB} ${MOUNT}/boot/

echo -e "${OK_COLOR}[muk] Install ISOs${NO_COLOR}"
rsync -auvzhP --exclude '*.txt' --progress ${ISO} ${MOUNT}/boot/

echo -e "${OK_COLOR}[muk] Done${NO_COLOR}"
