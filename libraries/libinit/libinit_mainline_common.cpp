/*
 * Copyright (C) 2025 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_mainline_common.h>

#include <libinit_dalvik_heap.h>
#include <libinit_misc.h>
#include <libinit_set_properties.h>

void vendor_init_mainline_common(void) {
    // enable_insecure_debugging(); // Commented out by default intentionally
    set_dalvik_heap();
#ifdef SET_PROPERTIES_FROM_DEVICETREE
    set_properties_from_devicetree();
#elifdef SET_PROPERTIES_FROM_DMI_ID
    set_properties_from_dmi_id();
#endif
}
