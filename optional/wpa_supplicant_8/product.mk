#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_HOSTAPD_AND_WPA_SUPPLICANT_FORM),legacy)

PRODUCT_PACKAGES += \
    hostapd \
    wpa_supplicant

else ifeq ($(TARGET_HOSTAPD_AND_WPA_SUPPLICANT_FORM),apex-aosp)

PRODUCT_PACKAGES += \
    com.android.hardware.wpa_supplicant

else ifeq ($(TARGET_HOSTAPD_AND_WPA_SUPPLICANT_FORM),apex-mainline_common)

ifndef SOONG_CONFIG_mainline_common_apex_wpa_supplicant_include_prebuilts
$(warning com.android.hardware.wpa_supplicant.mainline_common APEX is used but the list of prebuilts to be included was not set. Adding default configuration files to the list.)
$(call soong_config_set_string_list,mainline_common_apex_wpa_supplicant,include_prebuilts,wpa_supplicant.conf.prebuilt)
endif

PRODUCT_PACKAGES += \
    com.android.hardware.wpa_supplicant.mainline_common

endif
