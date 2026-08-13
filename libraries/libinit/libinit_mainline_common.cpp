/*
 * Copyright (C) 2025 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_mainline_common.h>

#include <libinit_dalvik_heap.h>
#include <libinit_misc.h>
#include <libinit_set_properties.h>

#include <android-base/properties.h>

#include <unistd.h>

using android::base::GetBoolProperty;

void vendor_process_bootenv_mainline_common(void) {
    if (access("/metadata/.enable_insecure_debugging", F_OK) == 0 ||
        GetBoolProperty("ro.boot.insecure_adb", false)) {
        enable_insecure_debugging();
    }
}

void vendor_load_properties_mainline_common(void) {
#ifdef SET_DALVIK_HEAP
    set_dalvik_heap();
#endif

    // Not ordered alphabetically, ordered by accuracy from low to high
#ifdef SET_PROPERTIES_FROM_DMI_ID
    set_properties_from_dmi_id();
#endif
#ifdef SET_PROPERTIES_FROM_DEVICETREE
    set_properties_from_devicetree();
#endif
}
