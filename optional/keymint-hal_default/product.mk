#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_SECURITY_KEYMINT_HAL),default)

PRODUCT_PACKAGES += \
    com.android.hardware.keymint.rust_nonsecure

endif # TARGET_SECURITY_KEYMINT_HAL
