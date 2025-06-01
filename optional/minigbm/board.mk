#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_ALLOCATOR_HAL),minigbm)

$(call soong_config_set, minigbm, platform, $(TARGET_MINIGBM_PLATFORM))

BOARD_VENDOR_SEPOLICY_DIRS += \
    external/minigbm/cros_gralloc/sepolicy \
    $(MAINLINE_COMMON_PATH)/sepolicy/vendor/minigbm

endif # TARGET_GRAPHICS_ALLOCATOR_HAL
