#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_MEDIA_C2_HAL),v4l2_codec2)

# Add the folder to the namespace.
PRODUCT_SOONG_NAMESPACES += external/v4l2_codec2

# Add the build target.
PRODUCT_PACKAGES += \
    android.hardware.media.c2@1.2-service-v4l2 \
    libc2plugin_store.vendor

# Install extended policy for codec2.
# The destination is: /vendor/etc/seccomp_policy/codec2.vendor.ext.policy
PRODUCT_PACKAGES += \
    codec2.vendor.ext.policy

TARGET_V4L2_CODEC2_USE_EXAMPLE_CONFIGURATION ?= true
ifeq ($(TARGET_V4L2_CODEC2_USE_EXAMPLE_CONFIGURATION),true)

# If a customized allocator is needed, then add this package.
# See more detail at "Customized allocator" section.
#PRODUCT_PACKAGES += \
#    libv4l2_codec2_vendor_allocator

# Install media_codecs_c2.xml.
# The destination is: /vendor/etc/media_codecs_c2.xml
PRODUCT_COPY_FILES += \
    $(MAINLINE_COMMON_PATH)/optional/v4l2_codec2/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml

# Set the customized property of v4l2_codec2, including:
# - The maximum concurrent instances for decoder/encoder.
#   It should be the same as "concurrent-instances" at media_codec_c2.xml.
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.v4l2_codec2.decode_concurrent_instances=8 \
    ro.vendor.v4l2_codec2.encode_concurrent_instances=8

# Codec2.0 poolMask:
#   ION(16)
#   BUFFERQUEUE(18)
#   BLOB(19)
#   V4L2_BUFFERQUEUE(20)
#   V4L2_BUFFERPOOL(21)
#   SECURE_LINEAR(22)
#   SECURE_GRAPHIC(23)
#
# For linear buffer allocation:
#   If ION is chosen, then the mask should be 0xf50000
#   If BLOB is chosen, then the mask should be 0xfc0000
PRODUCT_VENDOR_PROPERTIES += \
    debug.stagefright.c2-poolmask=0xf50000

endif # TARGET_V4L2_CODEC2_USE_EXAMPLE_CONFIGURATION

endif # TARGET_MEDIA_C2_HAL
