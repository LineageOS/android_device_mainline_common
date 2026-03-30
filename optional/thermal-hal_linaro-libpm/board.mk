#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_THERMAL_HAL),linaro-libpm)

BOARD_VENDOR_SEPOLICY_DIRS += \
    hardware/linaro/libpm/sepolicy/thermal

endif # TARGET_THERMAL_HAL
