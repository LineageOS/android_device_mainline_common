#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_VULKAN),swiftshader)

PRODUCT_PACKAGES += \
    org.lineageos.device.mainline.common.graphics.vulkan.swiftshader

# TODO(b/65201432): Swiftshader needs to create executable memory.
PRODUCT_REQUIRES_INSECURE_EXECMEM_FOR_SWIFTSHADER := true

endif # TARGET_GRAPHICS_VULKAN
