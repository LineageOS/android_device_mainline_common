#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_ALLOCATOR_HAL),default-hidl-2.0)

PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    manifest_mainline_common_graphics-allocator-hal_default-hidl-2.0.xml

$(call soong_config_set_bool,libui,legacy_gralloc,true)

endif # TARGET_GRAPHICS_ALLOCATOR_HAL
