#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_BLUETOOTH_HAL),default-aidl)

PRODUCT_PACKAGES += \
    android.hardware.bluetooth-service.default

endif # TARGET_BLUETOOTH_HAL
