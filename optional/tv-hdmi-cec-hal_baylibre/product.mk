#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_TV_HDMI_CEC_HAL),baylibre)

PRODUCT_PACKAGES += \
    android.hardware.tv.hdmi.cec-service.generic \
    android.hardware.tv.hdmi.connection-service.generic

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.hdmi.cec.xml

endif # TARGET_TV_HDMI_CEC_HAL
