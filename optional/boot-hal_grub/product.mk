#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_BOOT_HAL),grub)

PRODUCT_PACKAGES += \
    android.hardware.boot-service.grub_recovery \
    com.android.hardware.boot.grub

endif # TARGET_BOOT_HAL
