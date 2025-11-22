#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_TV_HDMI_CEC_HAL),baylibre)

BOARD_VENDOR_SEPOLICY_DIRS += \
    hardware/baylibre/hdmi/cec/sepolicy \
    hardware/baylibre/hdmi/connection/sepolicy

endif # TARGET_TV_HDMI_CEC_HAL
