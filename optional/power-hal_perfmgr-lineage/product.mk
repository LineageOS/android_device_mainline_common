#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_POWER_HAL),perfmgr-lineage)

PRODUCT_PACKAGES += \
    com.android.hardware.power.lineage_libperfmgr \
    perfmgr-lineage.rc \
    powerhint.json

PRODUCT_SOONG_NAMESPACES += \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/lineage/interfaces/power-libperfmgr

endif # TARGET_POWER_HAL
