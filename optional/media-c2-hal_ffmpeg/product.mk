#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_MEDIA_C2_HAL),ffmpeg)

PRODUCT_PACKAGES += \
    com.android.hardware.media.c2.ffmpeg

endif # TARGET_MEDIA_C2_HAL
