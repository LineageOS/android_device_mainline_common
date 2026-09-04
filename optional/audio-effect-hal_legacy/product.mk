#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_AUDIO_EFFECT_HAL),legacy)

ifeq ($(TARGET_AUDIO_HAL_TYPE),hidl)
$(error AIDL Audio Effects HAL cannot be used with HIDL Audio HAL.)
endif # TARGET_AUDIO_HAL_TYPE

PRODUCT_PACKAGES += \
    android.hardware.audio.effect.service-aidl.legacy

TARGET_AUDIO_EFFECT_HAL_LEGACY_USE_AOSP_DEFAULT_EFFECTS ?= true
ifeq ($(TARGET_AUDIO_EFFECT_HAL_LEGACY_USE_AOSP_DEFAULT_EFFECTS),true)
PRODUCT_PACKAGES += \
    aosp_audio_effects.xml \
    libbundlewrapper \
    libreverbwrapper \
    libvisualizer \
    libdownmix \
    libldnhncr \
    libdynproc \
    libhapticgenerator

$(call soong_config_set_bool,frameworks_av,use_aosp_audio_effects_config,true)
endif # TARGET_AUDIO_EFFECT_HAL_LEGACY_USE_AOSP_DEFAULT_EFFECTS

endif # TARGET_AUDIO_EFFECT_HAL
