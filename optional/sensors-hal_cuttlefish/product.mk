#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_SENSORS_HAL),cuttlefish)

$(call inherit-product, device/google/cuttlefish/shared/sensors/device_vendor.mk)

endif # TARGET_SENSORS_HAL
