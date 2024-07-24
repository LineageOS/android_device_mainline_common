#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_ENABLE_RECOVERY_ETHERNET_DHCP),true)

PRODUCT_PACKAGES += \
    dhcpclient.recovery

endif # TARGET_ENABLE_RECOVERY_ETHERNET_DHCP
