#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_CAMERA_PROVIDER_HAL),external)

PRODUCT_PACKAGES += \
    android.hardware.camera.provider-V1-external-service-lazy \
    manifest_mainline_common_camera-provider-hal_external.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.external.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.external.xml

TARGET_EXTERNAL_CAMERA_PROVIDER_HAL_USE_EXAMPLE_CONFIG ?= true
ifeq ($(TARGET_EXTERNAL_CAMERA_PROVIDER_HAL_USE_EXAMPLE_CONFIG),true)
PRODUCT_PACKAGES += \
    mainline_common_camera-provider-hal_external_external_camera_config.xml
endif

endif # TARGET_CAMERA_PROVIDER_HAL
