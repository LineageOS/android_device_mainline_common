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
    hardware/mainline/common

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
    dlkm_loader_mainline

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@latest-service.clearkey

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Go
ifeq ($(PRODUCT_IS_GO),true)
$(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults$(PRODUCT_GO_DEFAULTS_SUFFIX).mk)
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackageGo.mk)
## Enable DM file preopting to reduce first boot time
PRODUCT_DEX_PREOPT_GENERATE_DM_FILES := true
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := verify
ifeq ($(LINEAGE_BUILD),)
PRODUCT_PACKAGES += \
    Launcher3QuickStepGo
endif
endif

# Init
PRODUCT_PACKAGES += \
    init.mainline.rc \
    ueventd.mainline.rc

ifndef SOONG_CONFIG_libinit_vendor_init_lib
$(call soong_config_set,libinit,vendor_init_lib,//$(MAINLINE_COMMON_PATH):init_mainline_common)
endif

$(call soong_config_set_bool,mainline_common_init,enabled,true)

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

ifeq ($(PRODUCT_IS_GO),true)
DEVICE_PACKAGE_OVERLAYS += \
    $(MAINLINE_COMMON_PATH)/overlays/overlay-go
endif

ifneq ($(LINEAGE_BUILD),)
DEVICE_PACKAGE_OVERLAYS += \
    $(MAINLINE_COMMON_PATH)/overlays/overlay-lineage
endif

# Page size
PRODUCT_MAX_PAGE_SIZE_SUPPORTED := 16384
PRODUCT_NO_BIONIC_PAGE_SIZE_MACRO := true

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.credentials.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.credentials.xml

PRODUCT_PACKAGES += \
    android.software.ipsec_tunnels.prebuilt.xml

ifneq ($(PRODUCT_IS_ATV),true)
ifneq ($(PRODUCT_IS_AUTOMOTIVE),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml
endif
endif

ifeq ($(PRODUCT_IS_AUTOMOTIVE),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/car_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/car_core_hardware.xml
endif

ifeq ($(PRODUCT_IS_GO),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/go_handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/go_handheld_core_hardware.xml
endif

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.mainline.rc

ifeq ($(TARGET_HAS_BATTERY),false)
PRODUCT_VENDOR_PROPERTIES += \
    ro.recovery.batteryless=true
endif

# Seccomp policy
PRODUCT_PACKAGES += \
    mediaextractor.policy.vendor \
    mediaswcodec.policy.vendor

# UFFD GC
PRODUCT_ENABLE_UFFD_GC := true

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb.host.prebuilt.xml

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi.prebuilt.xml

$(call soong_config_set,hostapd,platform_version,$(PLATFORM_VERSION))
$(call soong_config_set,wpa_supplicant,platform_version,$(PLATFORM_VERSION))

# Wi-Fi firmware
PRODUCT_PACKAGES += \
    wireless-regdb

endif # !MAINLINE_COMMON_DISABLE_COMMON_PRODUCT_DEFS
