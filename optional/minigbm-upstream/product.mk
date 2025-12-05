#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_ALLOCATOR_HAL),minigbm-upstream)

ifeq ($(TARGET_MINIGBM_PLATFORM),gbm_mesa)
TARGET_MINIGBM_PLATFORM :=
TARGET_MINIGBM_UPSTREAM_ENABLE_GBM_MESA_DRIVER := true
endif

ifeq ($(TARGET_MINIGBM_UPSTREAM_ENABLE_GBM_MESA_DRIVER),true)
ifneq ($(TARGET_GRAPHICS),mesa)
$(error TARGET_GRAPHICS=mesa is required when TARGET_MINIGBM_UPSTREAM_ENABLE_GBM_MESA_DRIVER=true)
endif
PRODUCT_PACKAGES += \
    dri_gbm \
    libgbm_mesa
TARGET_MINIGBM_UPSTREAM_INSIDE_APEX := false
$(call soong_config_set_bool,minigbm_upstream,enable_gbm_mesa_driver,true)
endif

TARGET_MINIGBM_UPSTREAM_INSIDE_APEX ?= true
ifeq ($(TARGET_MINIGBM_UPSTREAM_INSIDE_APEX),true)
PRODUCT_PACKAGES += \
    org.lineageos.device.gralloc.minigbm_upstream
$(call soong_config_set,minigbm_upstream,RELEASE_SM_OPEN_DECLARED_PASSTHROUGH_HAL,$(RELEASE_SM_OPEN_DECLARED_PASSTHROUGH_HAL))
endif

# intentionally added for APEX too, `overrides` in APEX bp module would handle it
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator-service.minigbm_upstream \
    mapper.minigbm_upstream

endif # TARGET_GRAPHICS_ALLOCATOR_HAL
