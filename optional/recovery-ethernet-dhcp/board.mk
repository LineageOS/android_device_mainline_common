#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_ENABLE_RECOVERY_ETHERNET_DHCP),true)

TARGET_RECOVERY_UI_LIB ?= librecovery_ui_ethernet_dhcp

endif # TARGET_ENABLE_RECOVERY_ETHERNET_DHCP
