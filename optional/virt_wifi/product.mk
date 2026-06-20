#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_ENABLE_VIRT_WIFI),true)

PRODUCT_PACKAGES += \
    setup_wifi \
    virt_wifi.rc

endif # TARGET_ENABLE_VIRT_WIFI
