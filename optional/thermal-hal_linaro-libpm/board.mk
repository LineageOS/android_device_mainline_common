#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_THERMAL_HAL),linaro-libpm)

BOARD_VENDOR_SEPOLICY_DIRS += \
    hardware/linaro/libpm/sepolicy/thermal \
    $(MAINLINE_COMMON_PATH)/optional/thermal-hal_linaro-libpm/sepolicy

endif # TARGET_THERMAL_HAL
