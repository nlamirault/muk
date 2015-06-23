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

ISO="iso"
URIS="${ISO}/uri.txt"

for line in `grep -v -E "#|^\$" ${URIS}`; do
    IFS=';' read -a data <<< "${line}"
    echo "URI: ${data[0]}"
    echo "Type: ${data[1]}"
    echo "Value: ${data[2]}"
    name=`echo ${data[0]}|awk -F"/" '{print $NF}'`
    echo "ISO: $name"
    if [ -f $ISO/${name} ];
    then
        echo "ISO already present"
    else
        curl -o ${ISO}/${name} -L ${data[0]}
    fi
done
