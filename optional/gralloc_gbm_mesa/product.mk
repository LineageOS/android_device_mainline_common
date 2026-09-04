#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_ALLOCATOR_HAL),gralloc_gbm_mesa)

ifneq ($(TARGET_GRAPHICS),mesa)
$(error TARGET_GRAPHICS=mesa is required when TARGET_GRAPHICS_ALLOCATOR_HAL=gralloc_gbm_mesa)
endif

TARGET_GRALLOC_GBM_MESA_INSIDE_APEX ?= true
ifeq ($(TARGET_GRALLOC_GBM_MESA_INSIDE_APEX),true)
PRODUCT_PACKAGES += \
    com.android.hardware.graphics.allocator.gm
$(call soong_config_set,gralloc_gbm_mesa,RELEASE_SM_OPEN_DECLARED_PASSTHROUGH_HAL,$(RELEASE_SM_OPEN_DECLARED_PASSTHROUGH_HAL))
endif

PRODUCT_PACKAGES += \
    dri_gbm \
    libgbm_mesa

# intentionally added for APEX too, `overrides` in APEX bp module would handle it
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator-service.gm \
    mapper.gm

endif # TARGET_GRAPHICS_ALLOCATOR_HAL
