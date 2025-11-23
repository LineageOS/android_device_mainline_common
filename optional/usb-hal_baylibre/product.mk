#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifneq ($(filter baylibre,$(TARGET_USB_HAL) $(TARGET_USB_GADGET_HAL)),)

ifneq ($(TARGET_USB_HAL),$(TARGET_USB_GADGET_HAL))
$(error BayLibre USB HAL intends to be both USB HAL and USB Gadget HAL, otherwise it would crash.)
endif

PRODUCT_PACKAGES += \
    com.android.hardware.usb.generic

endif # TARGET_USB_HAL || TARGET_USB_GADGET_HAL
