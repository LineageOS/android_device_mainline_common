# Boot and partitions

**TL;DR:** Decide how the bootloader starts the kernel, which
partitions exist, then write one fstab. Do not skip `/metadata`.

## 1. How is the kernel started?

| Bootloader | Boot image? | Example |
|------------|-------------|---------|
| GRUB (PC, UEFI/BIOS) | No: kernel + ramdisk files | `basic_x86_64_pc` |
| U-Boot or a vendor bootloader | Depends on the bootloader | Your SoC vendor tree's docs |

Whether a boot image is used, and its header version, depends on what
the **bootloader** supports. For example, if GRUB loads the boot image,
GRUB's support decides the specification. The same logic applies to any
other bootloader.

Which bootloader you need is decided by the kernel port of the device.
A stock bootloader may boot mainline; some devices need a replacement.
Follow the existing Linux port. Vendor bootloader chains are described
in the docs of the matching `<SoC vendor>-common` tree or the device
README.

If the bootloader takes a boot image, set `BOARD_BOOTIMAGE_PARTITION_SIZE`
(this makes the build create it; `PRODUCT_BUILD_BOOT_IMAGE` is rarely
needed) and `BOARD_BOOT_HEADER_VERSION`. When the bootloader loads plain kernel and ramdisk files, no boot image is needed.

## 2. Boot parameters

Put them in `BOARD_KERNEL_CMDLINE` and `BOARD_BOOTCONFIG`. Start from
the common ones:

```
BOARD_BOOTCONFIG += $(MAINLINE_COMMON_ANDROIDBOOT_PARAMS)
BOARD_KERNEL_CMDLINE += $(MAINLINE_COMMON_KERNEL_PARAMS)
```

| Parameter | Meaning |
|-----------|---------|
| `androidboot.boot_devices=<path>` | Device that holds the boot partitions. `any` accepts every device (bringup only) |
| `androidboot.hardware=<name>` | Picks `fstab.<name>` and `init.<name>.rc` |
| `androidboot.partition_map=<dev>,<name>;...` | Name block devices that have no partition names. Escape `;` as `\;` in GRUB |
| `androidboot.selinux=permissive` | Bringup only |
| `androidboot.verifiedbootstate=orange` | Tell Android the bootloader is unlocked |
| `androidboot.mode` | Boot mode (see `generic/docs/boot-parameters.md`) |

`androidboot.partition_map` is read by init's `DeviceHandler`
(`system/core/init/devices.cpp`).

## 3. Partition layout

| Layout | Use when | Example |
|--------|----------|---------|
| Plain partitions | Few partitions, PC | `basic_x86_64_pc` |
| Dynamic partitions (`super`) | Phone-like | Your SoC vendor tree's reference device |

| Partition | Needed? | Note |
|-----------|---------|------|
| `system` | Yes | |
| `vendor` | Yes | |
| `userdata` | Yes | |
| `metadata` | **Yes** | Mounted like any fstab entry, but `aconfigd` uses it and many system components rely on `aconfigd` |
| `vendor_dlkm` / `system_dlkm` | Optional | Set `BOARD_USES_*IMAGE` for a standalone one. Without it, the content goes into an existing partition |
| `product`, `system_ext`, `odm` | Optional | |
| `boot`, `recovery` | If the bootloader uses images | Check partition size limits |

Set `BOARD_USES_METADATA_PARTITION := true`. Set per-partition
`BOARD_<P>IMAGE_FILE_SYSTEM_TYPE`, and a reserved size.

A/B: see `AB_OTA_UPDATER` and `TARGET_USES_MAINLINE_COMMON_AB_DEFS`
in `optional/README.md`. Boot control HALs differ per bootloader.

## 4. fstab

init looks for `fstab.<androidboot.hardware>` in `/odm/etc/`,
`/vendor/etc/`, and the first-stage ramdisk
(`system/fs/fs_mgr/libfstab/fstab.cpp`).

Template (from `basic_x86_64_pc`):

```
/dev/block/by-name/metadata /metadata ext4 <opts> check,formattable,first_stage_mount,metadata_csum
/dev/block/by-name/system   /system   ext4 noatime,ro first_stage_mount
/dev/block/by-name/vendor   /vendor   ext4 noatime,ro first_stage_mount
/dev/block/by-name/userdata /data     f2fs <opts> latemount,check,quota,formattable
```

| Flag | Meaning |
|------|---------|
| `first_stage_mount` | Mounted by first-stage init, before the rest boots |
| `latemount` | Mounted by `mount_all --late` |
| `formattable` | May be formatted if mount fails |

Install the fstab twice if first-stage init needs it: normal and
`.ramdisk` variant (see `fstab.basic_x86_64_pc.ramdisk`).
Recovery uses `TARGET_RECOVERY_FSTAB`.

## 5. Firmware

| What | How |
|------|-----|
| Kernel looks in | `firmware_class.path=/vendor/firmware/` (already in the common cmdline) |
| Extra firmware directories | `firmware_directories` in `ueventd.<device>.rc` |
| linux-firmware files | `PRODUCT_PACKAGES` entries from `external/linux-firmware-mainline` |
| Needed before `/vendor` is mounted | Put it in the ramdisk (see `generic/docs/porting.md`) |
| Files you do not have | Borrow them from the downstream `vendor/` tree of the device |

Do not ship firmware you may not redistribute.

## 6. Before first flash

- [ ] Backup of the original partitions
- [ ] Know how to get back (stock flash, fastboot, serial)
- [ ] Device specific steps (erase `dtbo`, bootloader build) are in the
      device README

## Check

- [ ] Kernel log shows `/system` and `/vendor` mounted
- [ ] `/metadata` is mounted (`aconfigd` needs it)

Next: [Optional modules](CHOOSING_OPTIONAL_MODULES.md)
