#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

MAINLINE_COMMON_PATH := device/mainline/common

# Include the fragments
include $(MAINLINE_COMMON_PATH)/optional/*/product.mk

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(MAINLINE_COMMON_PATH) \
    external/linux-firmware-mainline \
    hardware/mainline

ifneq ($(MAINLINE_COMMON_DISABLE_COMMON_PRODUCT_DEFS),true)

# Audio
ifeq ($(TARGET_AUDIO_HAL_TYPE),hidl)
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio-impl \
    audio.bluetooth.default \
    audio.r_submix.default \
    audio.usbv2.default
endif

# Audio - utilities
PRODUCT_PACKAGES_DEBUG += \
    tinycap2 \
    tinymix2 \
    tinypcminfo2 \
    tinyplay2

# DLKM Loader
PRODUCT_PACKAGES += \
    dlkm_loader

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@latest-service.clearkey

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Init
PRODUCT_PACKAGES += \
    init.mainline.rc \
    ueventd.mainline.rc

$(call soong_config_set,libinit,vendor_init_lib,//$(MAINLINE_COMMON_PATH):init_mainline_common)

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Page size
PRODUCT_MAX_PAGE_SIZE_SUPPORTED := 16384
PRODUCT_NO_BIONIC_PAGE_SIZE_MACRO := true

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.credentials.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.credentials.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

PRODUCT_PACKAGES += \
    android.software.ipsec_tunnels.prebuilt.xml

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.mainline.rc

ifeq ($(TARGET_HAS_BATTERY),false)
PRODUCT_VENDOR_PROPERTIES += \
    ro.recovery.batteryless=true
endif

# Seccomp policy
PRODUCT_PACKAGES += \
    mediaswcodec.policy.vendor

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(MAINLINE_COMMON_PATH)/init

# UFFD GC
PRODUCT_ENABLE_UFFD_GC := true

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb.host.prebuilt.xml

# Wi-Fi
PRODUCT_PACKAGES += \
    hostapd \
    wpa_supplicant

PRODUCT_PACKAGES += \
    android.hardware.wifi.prebuilt.xml

endif # !MAINLINE_COMMON_DISABLE_COMMON_PRODUCT_DEFS
