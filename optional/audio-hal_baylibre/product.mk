#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_AUDIO_HAL),baylibre)

PRODUCT_PACKAGES += \
    com.android.hardware.audio.generic

PRODUCT_COPY_FILES += \
    hardware/baylibre/audio/audio_effects_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects_config.xml

endif # TARGET_AUDIO_HAL
