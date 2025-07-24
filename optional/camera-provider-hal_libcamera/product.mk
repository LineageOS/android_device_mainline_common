#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_CAMERA_PROVIDER_HAL),libcamera)

PRODUCT_PACKAGES += \
    com.android.hardware.camera.libcamera

PRODUCT_PACKAGES += \
    android.hardware.camera.front.prebuilt.xml \
    android.hardware.camera.full.prebuilt.xml \
    android.hardware.camera.raw.prebuilt.xml

PRODUCT_PACKAGES_DEBUG += \
    cam

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.camera=libcamera

# This should be provided by the device, installed to /vendor/etc/libcamera/camera_hal.yaml
PRODUCT_PACKAGES += libcamera_camera_hal.yaml

endif # TARGET_CAMERA_PROVIDER_HAL
