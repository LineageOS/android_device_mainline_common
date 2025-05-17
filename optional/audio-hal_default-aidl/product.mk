#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_AUDIO_HAL),default-aidl)

PRODUCT_PACKAGES += \
    com.android.hardware.audio

PRODUCT_COPY_FILES += \
    hardware/interfaces/audio/aidl/default/audio_effects_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects_config.xml

TARGET_AUDIO_HAL_TYPE := aidl

endif # TARGET_AUDIO_HAL
