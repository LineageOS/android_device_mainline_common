#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_FOLLOWS_LATEST_VINTF_TARGET_LEVEL),true)

DEVICE_MANIFEST_FILE += $(MAINLINE_COMMON_PATH)/optional/vintf-target-level_latest/manifest.xml

endif # TARGET_FOLLOWS_LATEST_VINTF_TARGET_LEVEL
