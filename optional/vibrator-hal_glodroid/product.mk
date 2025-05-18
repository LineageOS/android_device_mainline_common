#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_VIBRATOR_HAL),vibrator-hal_glodroid)

PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.glodroid

endif # TARGET_VIBRATOR_HAL
