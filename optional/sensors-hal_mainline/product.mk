#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_SENSORS_HAL),mainline)

PRODUCT_PACKAGES += \
    com.android.hardware.sensors.mainline

endif # TARGET_SENSORS_HAL
