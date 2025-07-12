#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_CAMERA_PROVIDER_HAL),emulated)

PRODUCT_PACKAGES += \
    com.google.emulated.camera.provider.hal

PRODUCT_SOONG_NAMESPACES += \
    hardware/google/camera/devices/EmulatedCamera

endif # TARGET_CAMERA_PROVIDER_HAL
