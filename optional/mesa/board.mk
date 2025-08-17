#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

ifneq ($(filter mesa,$(TARGET_GRAPHICS_EGL) $(TARGET_GRAPHICS_VULKAN)),)

BOARD_MESA3D_USES_MESON_BUILD := true

MESA_VERSION_STRING := $(or $(shell cat external/mesa/VERSION 2>/dev/null),$(shell cat hardware/mesa/VERSION))
MESA_VERSION_MAJOR := $(shell echo "$(MESA_VERSION_STRING)" | cut -d '.' -f 1)
MESA_VERSION_MINOR := $(shell echo "$(MESA_VERSION_STRING)" | cut -d '.' -f 2)
MESA_VERSION_PATCH_PRE := $(shell echo "$(MESA_VERSION_STRING)" | cut -d '.' -f 3)
MESA_VERSION_PATCH := $(shell echo "$(MESA_VERSION_PATCH_PRE)" | cut -d '-' -f 1)
MESA_VERSION_PRE_RELEASE := $(shell echo "$(MESA_VERSION_PATCH_PRE)" | cut -d '-' -f 2)

ifeq ($(shell expr $(MESA_VERSION_MAJOR) \>= 25), 1)
BOARD_MESA3D_MESON_ARGS := -Dmesa-clc=system
endif

ifneq ($(wildcard external/llvm-project/Android.bp),)
BUILD_BROKEN_PLUGIN_VALIDATION += \
    soong-llvm12 \
    soong-llvm17 \
    soong-llvm18 \
    soong-llvm19
BOARD_MESA3D_GALLIUM_DRIVERS += llvmpipe softpipe
BOARD_MESA3D_VULKAN_DRIVERS += swrast
endif

endif # TARGET_GRAPHICS_EGL || TARGET_GRAPHICS_VULKAN
