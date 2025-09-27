#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_SENSORS_HAL),cuttlefish)

include device/google/cuttlefish/shared/sensors/BoardConfig.mk

endif # TARGET_SENSORS_HAL
