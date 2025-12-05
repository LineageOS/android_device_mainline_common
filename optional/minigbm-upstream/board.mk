#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_ALLOCATOR_HAL),minigbm-upstream)

BOARD_VENDOR_SEPOLICY_DIRS += \
    external/minigbm-upstream/cros_gralloc/sepolicy \
    $(MAINLINE_COMMON_PATH)/sepolicy/vendor/minigbm

ifeq ($(TARGET_INITIAL_BRINGUP),true)
$(warning Enabling all platforms in minigbm-upstream. Please configure appropriate minigbm_upstream soong config variables once TARGET_INITIAL_BRINGUP is unset.)
$(call soong_config_set,minigbm_upstream,platform,all)
endif

endif # TARGET_GRAPHICS_ALLOCATOR_HAL
