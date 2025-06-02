#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_TOUCHSCREEN_HAS_VIRTUAL_KEYS),true)

PRODUCT_PACKAGES += \
    ts_vkeys \
    ts_vkeys_recovery

endif # TARGET_TOUCHSCREEN_HAS_VIRTUAL_KEYS
