#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_MEDIA_C2_HAL),ffmpeg)

PRODUCT_PACKAGES += \
    com.android.hardware.media.c2.ffmpeg

PRODUCT_COPY_FILES += \
    $(MAINLINE_COMMON_PATH)/optional/media-c2-hal_ffmpeg/media_codecs_ffmpeg_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml

endif # TARGET_MEDIA_C2_HAL
