#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_THERMAL_HAL),linaro-libpm)

PRODUCT_PACKAGES += \
    android.hardware.thermal-service.linaro-generic

endif # TARGET_THERMAL_HAL
