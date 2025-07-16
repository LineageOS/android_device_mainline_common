#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifneq ($(TARGET_PREBUILT_KERNEL),)

# AOSP requires the kernel get copied to PRODUCT_OUT, but does not define the copy
# Lineage inline kernel building support handles this copy, so don't duplicate
ifneq ($(SUPPORTS_INLINE_KERNEL_BUILDING),true)
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel
endif

endif # TARGET_PREBUILT_KERNEL
