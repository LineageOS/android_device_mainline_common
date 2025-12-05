#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_ALLOCATOR_HAL),minigbm-upstream)

TARGET_MINIGBM_UPSTREAM_INSIDE_APEX ?= true
ifeq ($(TARGET_MINIGBM_UPSTREAM_INSIDE_APEX),true)
PRODUCT_PACKAGES += \
    org.lineageos.device.gralloc.minigbm_upstream
else
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator-service.minigbm_upstream \
    mapper.minigbm_upstream
endif

ifeq ($(TARGET_MINIGBM_UPSTREAM_ENABLE_GBM_MESA_DRIVER),true)
ifneq ($(TARGET_GRAPHICS),mesa)
$(error TARGET_GRAPHICS=mesa is required when TARGET_MINIGBM_UPSTREAM_ENABLE_GBM_MESA_DRIVER=true)
endif
PRODUCT_PACKAGES += \
    dri_gbm \
    libgbm_mesa
$(call soong_config_set_bool,minigbm_upstream,enable_gbm_mesa_driver,true)
endif

endif # TARGET_GRAPHICS_ALLOCATOR_HAL
