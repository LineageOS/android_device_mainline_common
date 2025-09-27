#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_SENSORS_HAL),iio)

PRODUCT_PACKAGES += \
    android.hardware.sensors-service.multihal \
    android.hardware.sensors@2.0-subhal-impl-1.0 \
    sensors.iio

PRODUCT_PACKAGES_DEBUG += \
    sens

PRODUCT_COPY_FILES += \
    $(MAINLINE_COMMON_PATH)/optional/sensors-hal_iio/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.sensors=iio

PRODUCT_SOONG_NAMESPACES += \
    hardware/intel/sensors-iio

endif # TARGET_SENSORS_HAL
