/*
 * Copyright (C) 2025 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_set_properties.h>
#include <libinit_utils.h>

#include <android-base/file.h>

#include <unordered_map>

using android::base::ReadFileToString;

static const std::string kDmiIdPath = "/sys/devices/virtual/dmi/id/";
static const std::string kDeviceTreePath = "/sys/firmware/devicetree/base/";

static const std::unordered_map<std::string, std::string> kDmiIdToPropertyMap = {
        {"bios_version", "ro.boot.bootloader"},
        {"product_serial", "ro.serialno"},
};

static const std::unordered_map<std::string, std::string> kDmiIdToRoBuildPropMap = {
        {"chassis_vendor", "brand"},
        {"product_name", "model"},
        {"sys_vendor", "manufacturer"},
};

void set_properties_from_devicetree() {
    std::string dt_model;
    ReadFileToString(kDeviceTreePath + "model", &dt_model);
    if (dt_model.empty()) return;
    dt_model.pop_back();

    auto dt_model_first_bracket_pos = dt_model.find_first_of('(');
    if (dt_model_first_bracket_pos != std::string::npos) {
        dt_model = dt_model.substr(0, dt_model_first_bracket_pos - 1);
    }

    auto dt_model_first_space_pos = dt_model.find_first_of(' ');
    if (dt_model_first_space_pos == std::string::npos) {
        set_ro_build_prop("model", dt_model, true);
    } else {
        std::string brand = dt_model.substr(0, dt_model_first_space_pos);
        std::string model = dt_model.substr(dt_model_first_space_pos + 1);
        set_ro_build_prop("brand", brand, true);
        set_ro_build_prop("model", model, true);
    }
}

void set_properties_from_dmi_id() {
    std::string value;

    for (const auto& [file, prop] : kDmiIdToPropertyMap) {
        ReadFileToString(kDmiIdPath + file, &value);
        if (value.empty()) continue;
        value.pop_back();
        property_override(prop, value);
    }

    for (const auto& [file, ro_build_prop] : kDmiIdToRoBuildPropMap) {
        ReadFileToString(kDmiIdPath + file, &value);
        if (value.empty()) continue;
        value.pop_back();
        set_ro_build_prop(ro_build_prop, value, true);
    }
}
