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

ISO="iso"
URIS="${ISO}/uri.txt"

echo "[muk] Download Linux ISOs"
for line in `grep -v -E "#|^\$" ${URIS}`; do
    IFS=';' read -a data <<< "${line}"
    # echo -e "[muk] URI: ${data[0]}"
    # echo -e "[muk] Type: ${data[1]}"
    # echo -e "[muk] Value: ${data[2]}"
    name=`echo ${data[0]}|awk -F"/" '{print $NF}'`
    echo -e "[muk] ISO: $name"
    if [ -f $ISO/${name} ];
    then
        echo -e "${OK_COLOR}[muk] ISO already present${NO_COLOR}"
    else
        echo -e "${OK_COLOR}[muk] Download ISO for $name${NO_COLOR}"
        curl --progress-bar -o ${ISO}/${name} -L ${data[0]}
    fi
done
