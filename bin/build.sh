#!/bin/bash

# Copyright (C) 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

MOUNT="/mnt"
DIR=`pwd`
ISO="${DIR}/iso"
GRUB="${DIR}/grub"

if [ -z "$1" ]; then
	echo "Need parameter.: $0 sdb1"
	exit 1
fi

DEV="/dev/$1"

echo -e "${OK_COLOR}[muk] Use ${DEV}${NO_COLOR}"
mount ${DEV} ${MOUNT}/muk

echo -e "${OK_COLOR}[muk] Initialize key${NO_COLOR}"
mkdir -p ${MOUNT}/muk/{boot,iso}

echo -e "${OK_COLOR}[muk] Install GRUB${NO_COLOR}"
grub-install --force --no-floppy --boot-directory=${MOUNT}/muk/boot ${DEV}
grub-install --force --no-floppy --boot-directory=/mnt/muk/boot /dev/sdb
echo -e "${OK_COLOR}[muk] Install Iso and Boot${NO_COLOR}"
touch ${MOUNT}/muk/boot/grub/grub.cfg
# cp -r ${GRUB} ${MOUNT}/muk/boot/
# rsync -auvzh --exclude '*.txt' --progress ${ISO} ${MOUNT}/muk/

echo -e "${OK_COLOR}[muk] Finish installation${NO_COLOR}"
umount ${MOUNT}/muk

echo -e "${OK_COLOR}[muk] Done${NO_COLOR}"
