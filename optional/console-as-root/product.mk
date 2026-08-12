#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(TARGET_CONSOLE_AS_ROOT),true)

PRODUCT_PACKAGES_DEBUG += \
    init.console-as-root.rc

endif # TARGET_CONSOLE_AS_ROOT
