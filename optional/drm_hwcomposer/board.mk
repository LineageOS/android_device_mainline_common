#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_COMPOSER_HAL),drm_hwcomposer)

$(call soong_config_set, minigbm, platform, $(TARGET_MINIGBM_PLATFORM))

BOARD_VENDOR_SEPOLICY_DIRS += \
    $(MAINLINE_COMMON_PATH)/optional/drm_hwcomposer/sepolicy

endif # TARGET_GRAPHICS_COMPOSER_HAL
