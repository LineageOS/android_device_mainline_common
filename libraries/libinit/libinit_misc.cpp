/*
 * Copyright (C) 2025 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_misc.h>

#include <libinit_utils.h>

#include <string>
#include <unordered_map>

void enable_insecure_debugging(void) {
    const std::unordered_map<std::string, std::string> kPropsToSet = {
            {"ro.adb.secure", "0"},
            {"ro.boot.verifiedbootstate", "orange"},
            {"ro.debuggable", "1"},
            {"ro.secure", "0"},
    };

    for (const auto& [key, value] : kPropsToSet) {
        property_override(key, value);
    }
}

void enable_memfd_if_ashmem_is_absent(void) {
    // ashmem driver can only be built-in in the kernel
    if (access("/dev/ashmem", F_OK) != 0) {
        property_override("sys.use_memfd", "true");
    }
}
