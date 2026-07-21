#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_ENABLE_USBIP),true)

PRODUCT_PACKAGES += \
    usbip \
    usbipd \
    usbip.recovery \
    usbipd.recovery

PRODUCT_PACKAGES += \
    init.recovery.usbip.rc

endif # TARGET_ENABLE_USBIP
