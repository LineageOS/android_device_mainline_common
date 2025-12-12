#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_SECURITY_KEYMINT_HAL),default)

TARGET_KEYMINT_HAL_DEFAULT_INSIDE_APEX ?= true
ifeq ($(TARGET_KEYMINT_HAL_DEFAULT_INSIDE_APEX),true)
PRODUCT_PACKAGES += \
    com.android.hardware.keymint.rust_nonsecure
else
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-service
endif

endif # TARGET_SECURITY_KEYMINT_HAL
