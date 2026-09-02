#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_GRAPHICS_VULKAN),swiftshader)

PRODUCT_PACKAGES += \
    org.lineageos.device.graphics.vulkan.swiftshader

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_4.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml

# TODO(b/65201432): Swiftshader needs to create executable memory.
PRODUCT_REQUIRES_INSECURE_EXECMEM_FOR_SWIFTSHADER := true

TARGET_USES_VULKAN := true

endif # TARGET_GRAPHICS_VULKAN
