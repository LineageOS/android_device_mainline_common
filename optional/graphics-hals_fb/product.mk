#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_USES_FRAMEBUFFER_DISPLAY),true)

PRODUCT_PACKAGES += \
    com.android.hardware.graphics.allocator.fb \
    mapper.fb

$(call soong_config_set,fb_graphics,RELEASE_SM_OPEN_DECLARED_PASSTHROUGH_HAL,$(RELEASE_SM_OPEN_DECLARED_PASSTHROUGH_HAL))

endif # TARGET_USES_FRAMEBUFFER_DISPLAY
