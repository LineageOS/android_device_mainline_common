#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_USES_TABLET_INPUT_AS_TOUCHSCREEN),true)

PRODUCT_PACKAGES += \
    tablet2multitouch \
    tablet2multitouch_recovery \
    tablet2multitouch.idc

endif # TARGET_USES_TABLET_INPUT_AS_TOUCHSCREEN
