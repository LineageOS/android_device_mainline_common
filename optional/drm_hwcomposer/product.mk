#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_COMPOSER_HAL),drm_hwcomposer)

TARGET_DRM_HWCOMPOSER_VARIANT ?= upstream
ifeq ($(TARGET_DRM_HWCOMPOSER_VARIANT),upstream)
LOCAL_SUFFIX := _upstream
else
LOCAL_SUFFIX :=
endif

TARGET_DRM_HWCOMPOSER_HAL_INTERFACE ?= aidl
ifeq ($(TARGET_DRM_HWCOMPOSER_HAL_INTERFACE),aidl)
TARGET_DRM_HWCOMPOSER_INSIDE_APEX ?= true
ifeq ($(TARGET_DRM_HWCOMPOSER_INSIDE_APEX),true)
PRODUCT_PACKAGES += \
    com.android.hardware.graphics.composer.drm_hwcomposer$(LOCAL_SUFFIX)
else
PRODUCT_PACKAGES += \
    android.hardware.composer.hwc3-service.drm$(LOCAL_SUFFIX)
endif
else ifeq ($(TARGET_DRM_HWCOMPOSER_HAL_INTERFACE),libhardware)
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4-service \
    hwcomposer.drm$(LOCAL_SUFFIX) \
    manifest_mainline_common_graphics-composer-hal_drm_hwcomposer_libhardware.xml
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.hwcomposer=drm$(LOCAL_SUFFIX)
else
$(error Not supported)
endif

endif # TARGET_GRAPHICS_COMPOSER_HAL
