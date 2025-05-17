#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_AUDIO_HAL),tinyhal)

PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio@7.1-impl \
    audio.primary.tinyhal \
    manifest_mainline_common_audio-hal_tinyhal.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.audio.primary=tinyhal

PRODUCT_SOONG_NAMESPACES += \
    external/tinyhal

TARGET_AUDIO_HAL_TYPE := hidl

endif # TARGET_AUDIO_HAL
