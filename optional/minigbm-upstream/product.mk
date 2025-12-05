#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_ALLOCATOR_HAL),minigbm-upstream)

TARGET_MINIGBM_UPSTREAM_INSIDE_APEX ?= true
ifeq ($(TARGET_MINIGBM_UPSTREAM_INSIDE_APEX),true)
PRODUCT_PACKAGES += \
    org.lineageos.device.gralloc.minigbm_upstream
endif

# intentionally added for APEX too, `overrides` in APEX bp module would handle it
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator-service.minigbm_upstream \
    mapper.minigbm_upstream

endif # TARGET_GRAPHICS_ALLOCATOR_HAL
