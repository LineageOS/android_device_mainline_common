#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_ALLOCATOR_HAL),minigbm)

ifeq ($(TARGET_MINIGBM_PLATFORM),)
LOCAL_MINIGBM_MODULE_SUFFIX :=
else
LOCAL_MINIGBM_MODULE_SUFFIX := _$(TARGET_MINIGBM_PLATFORM)

$(call soong_config_set, minigbm, platform, $(TARGET_MINIGBM_PLATFORM))
endif

ifeq ($(TARGET_MINIGBM_PLATFORM),gbm_mesa)
ifneq ($(TARGET_GRAPHICS),mesa)
$(error TARGET_GRAPHICS=mesa is required when TARGET_MINIGBM_PLATFORM=gbm_mesa)
endif # TARGET_GRAPHICS
endif # TARGET_MINIGBM_PLATFORM

TARGET_MINIGBM_HAL_INTERFACE ?= aidl
ifeq ($(TARGET_MINIGBM_HAL_INTERFACE),aidl)
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator-service.minigbm \
    mapper.minigbm
else ifeq ($(TARGET_MINIGBM_HAL_INTERFACE),hidl)
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@4.0-service.minigbm$(LOCAL_MINIGBM_MODULE_SUFFIX) \
    android.hardware.graphics.mapper@4.0-impl.minigbm$(LOCAL_MINIGBM_MODULE_SUFFIX)
else ifeq ($(TARGET_MINIGBM_HAL_INTERFACE),libhardware)
PRODUCT_PACKAGES += \
    gralloc.minigbm$(LOCAL_MINIGBM_MODULE_SUFFIX)

ifneq ($(TARGET_MINIGBM_DO_NOT_SET_AS_DEFAULT),true)
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.gralloc=minigbm$(LOCAL_MINIGBM_MODULE_SUFFIX)
endif
else
$(error Not supported)
endif

ifeq ($(TARGET_MINIGBM_PLATFORM),gbm_mesa)
PRODUCT_PACKAGES += \
    dri_gbm \
    libgbm_mesa
endif

endif # TARGET_GRAPHICS_ALLOCATOR_HAL
