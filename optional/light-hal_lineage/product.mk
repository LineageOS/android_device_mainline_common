#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_LIGHT_HAL),lineage)

PRODUCT_PACKAGES += \
    android.hardware.light-service.lineage

$(call soong_config_set_bool,lineagelight,scan_for_backlight_devices,$(TARGET_LIGHT_HAL_SCAN_FOR_BACKLIGHT_DEVICES))

endif # TARGET_LIGHT_HAL
