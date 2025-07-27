#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_COMPOSER_HAL),drmfb-composer)

BOARD_VENDOR_SEPOLICY_DIRS += external/drmfb-composer/sepolicy

endif # TARGET_GRAPHICS_COMPOSER_HAL
