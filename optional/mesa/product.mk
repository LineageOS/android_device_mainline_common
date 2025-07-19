#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifneq ($(filter mesa,$(TARGET_GRAPHICS_EGL) $(TARGET_GRAPHICS_VULKAN)),)

PRODUCT_PACKAGES += \
    mesa3d

ifneq ($(TARGET_MESA_DO_NOT_SET_AS_DEFAULT),true)
ifeq ($(TARGET_GRAPHICS_EGL),mesa)

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.egl=mesa

endif # TARGET_GRAPHICS_EGL
endif # !TARGET_MESA_DO_NOT_SET_AS_DEFAULT

endif # TARGET_GRAPHICS_EGL || TARGET_GRAPHICS_VULKAN
