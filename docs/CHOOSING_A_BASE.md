# Choosing a base

**TL;DR:** UEFI/ACPI PC or SBC that should "just work" → `generic`.
SoC with its own vendor tree → that tree. Anything else → write your
own on top of `mainline/common`.

## Decision table

| Your device | Use | Why |
|-------------|-----|-----|
| Boots through UEFI, has standard hardware | `device/mainline/generic` | One image for many machines, `generic_init` detects hardware at boot |
| Needs a minimal start, just to see Android run | `device/pc/basic_x86_64_pc` | Smallest tree, easy to read |
| SoC that has a `<SoC vendor>-common` tree | `device/mainline/<vendor>-common` | SoC support is already there |
| Virtual machine | `device/virt/*` | Already done; no new tree needed |
| Anything else | `device/mainline/common` | You write the device-specific parts |

## SoC vendor trees

A `<SoC vendor>-common` tree sits on top of `mainline/common` and holds
everything specific to that vendor's SoCs. More of them may appear.

- Its docs live in its own repo: `device/mainline/<vendor>-common/docs/`.
- Vendor specifics (bootloader, firmware, daemons, SoC lists) are
  documented **there**, not in this guide.
- Currently available: `qcom-common`.

## What each base gives you

| Base | Gives you | You still write |
|------|-----------|-----------------|
| `mainline/common` | Optional HAL system, sepolicy, common init, `libinit` | Everything device-specific |
| `mainline/<vendor>-common` | The above plus the vendor layer | See its docs |
| `mainline/generic` | Runtime hardware detection | Usually nothing, only a kernel config |

## Per-device vs generic: how to pick

- Fixed hardware, one board: **per-device tree**. Everything is known at
  build time, so the image is smaller and simpler.
- Many different machines, UEFI: **generic**.
- Unsure? Start per-device with `basic_x86_64_pc` as a model. You can
  switch later.

## Next

[Bringup overview](BRINGUP_OVERVIEW.md)
