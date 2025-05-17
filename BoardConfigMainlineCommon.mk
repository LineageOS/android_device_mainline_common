#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

USES_DEVICE_MAINLINE_COMMON := true

include $(MAINLINE_COMMON_PATH)/optional/*/board.mk

# Bootloader
TARGET_NO_BOOTLOADER := true

# Boot parameters
MAINLINE_COMMON_ANDROIDBOOT_PARAMS := \
    androidboot.init_fatal_reboot_target=recovery
MAINLINE_COMMON_KERNEL_PARAMS := \
    firmware_class.path=/vendor/firmware/ \
    log_buf_len=4M \
    loop.max_part=7 \
    printk.devkmsg=on \
    rw \
    vt.global_cursor_default=0

ifeq ($(TARGET_INITIAL_BRINGUP),true)
MAINLINE_COMMON_ANDROIDBOOT_PARAMS += \
    androidboot.boot_devices=any \
    androidboot.selinux=permissive
MAINLINE_COMMON_KERNEL_PARAMS += \
    audit=0 \
    panic=-1
endif

# Filesystem
ifeq ($(TARGET_BOOTS_16K),true)
BOARD_EROFS_BLOCKSIZE := 16384
BOARD_F2FS_BLOCKSIZE := 16384
endif

# Properties
TARGET_SYSTEM_EXT_PROP += $(MAINLINE_COMMON_PATH)/properties/system_ext.prop
TARGET_VENDOR_PROP += $(MAINLINE_COMMON_PATH)/properties/vendor.prop

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
VENDOR_SECURITY_PATCH = $(PLATFORM_SECURITY_PATCH)

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += \
    $(MAINLINE_COMMON_PATH)/sepolicy/vendor

# Wi-Fi
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
