#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_COMPOSER_HAL),drmfb-composer)

PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-service.drmfb

ifeq ($(TARGET_GRAPHICS_ALLOCATOR_HAL),minigbm)
$(call soong_config_set_bool,drmfb_composer,uses_minigbm,true)
endif # TARGET_GRAPHICS_ALLOCATOR_HAL

endif # TARGET_GRAPHICS_COMPOSER_HAL
