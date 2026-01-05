#! /vendor/bin/sh
# Set Bluetooth address (BT_ADDR).

#
# Copyright (C) 2023 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Get the unique board serial number from /proc/cmdline or
# /proc/bootconfig, prepend '0's to the serial number to
# fill 5 LSBs of the BT address and prepend "C0" as MSB to
# prepare a 6 byte Bluetooth Random Static Address. Reference:
# https://www.bluetooth.com/wp-content/uploads/2022/05/Bluetooth_LE_Primer_Paper.pdf [Page 23]
#
# Format the output in xx:xx:xx:xx:xx:xx format for the
# "bdaddr" command to work.

BTADDR=`/vendor/bin/cat /proc/cmdline | /vendor/bin/grep -o serialno.* |\
	/vendor/bin/cut -f2 -d'=' | /vendor/bin/awk '{printf("c0%010s\n", $1)}' |\
	/vendor/bin/sed 's/\(..\)/\1:/g' | /vendor/bin/sed '$s/:$//'`
if [ -z "${BTADDR}" ]
then
  BTADDR=`/vendor/bin/cat /proc/bootconfig | /vendor/bin/grep -o serialno.* |\
	  /vendor/bin/cut -f2 -d'=' | /vendor/bin/cut -c 3-10 |\
	  /vendor/bin/awk '{printf("c0%010s\n", $1)}' |\
	  /vendor/bin/sed 's/\(..\)/\1:/g' | /vendor/bin/sed '$s/:$//'`
fi

/vendor/bin/hw/bdaddr "${BTADDR}"
