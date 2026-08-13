/*
 * Copyright (C) 2021-2025 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include "vendor_init.h"

#include <libinit_mainline_common.h>

void vendor_process_bootenv() {
    vendor_process_bootenv_mainline_common();
}

void vendor_load_properties() {
    vendor_load_properties_mainline_common();
}
