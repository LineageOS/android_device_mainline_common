#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GATEKEEPER_HAL),software-aidl)

BOARD_VENDOR_SEPOLICY_DIRS += \
    $(MAINLINE_COMMON_PATH)/optional/gatekeeper-hal_software-aidl/sepolicy

endif # TARGET_GATEKEEPER_HAL
