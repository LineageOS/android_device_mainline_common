/*
 * Copyright (C) 2021-2025 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include "vendor_init.h"

#include <libinit_dalvik_heap.h>
#include <libinit_set_properties.h>

void vendor_load_properties() {
    set_dalvik_heap();
#ifdef SET_PROPERTIES_FROM_DEVICETREE
    set_properties_from_devicetree();
#elifdef SET_PROPERTIES_FROM_DMI_ID
    set_properties_from_dmi_id();
#endif
}
