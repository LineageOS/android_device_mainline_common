#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_AUDIO_POLICY),common-handheld-7.0)

PRODUCT_PACKAGES += \
    usbv2_audio_policy_configuration.xml

LOCAL_FWK_AUDIO_POLICY_COPY := \
    a2dp_in_audio_policy_configuration_7_0.xml \
    audio_policy_volumes.xml \
    bluetooth_audio_policy_configuration_7_0.xml \
    default_volume_tables.xml \
    r_submix_audio_policy_configuration.xml

PRODUCT_COPY_FILES += \
    $(foreach f,$(LOCAL_FWK_AUDIO_POLICY_COPY),frameworks/av/services/audiopolicy/config/$(f):$(TARGET_COPY_OUT_VENDOR)/etc/$(f)) \
    $(MAINLINE_COMMON_PATH)/optional/audio-policy_common-handheld-7.0/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

endif # TARGET_AUDIO_POLICY
