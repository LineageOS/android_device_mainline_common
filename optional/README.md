## A/B

### TARGET_USES_MAINLINE_COMMON_AB_DEFS
| Value | Directory | Description |
|-------|-----------|-------------|
| true | ab | Enable A/B definitions from mainline/common |

## Audio

### TARGET_AUDIO_HAL
| Value | Directory | Description |
|-------|-----------|-------------|
| default-aidl | audio-hal_default-aidl | Usable on targets without any sound card or with a simple sound card |

## Bluetooth

### TARGET_BLUETOOTH_HAL
| Value | Directory | Description |
|-------|-----------|-------------|
| default-aidl | bluetooth-hal_default-aidl | HCI-based Bluetooth AIDL HAL |

## Graphics

### TARGET_GRAPHICS
| Value | Directory | Description |
|-------|-----------|-------------|
| mesa | mesa | Typically for targets that supports 3D acceleration |
| swiftshader | swiftshader | For targets without 3D acceleration |

### TARGET_GRAPHICS_EGL
| Value | Directory | Description |
|-------|-----------|-------------|
| angle | angle | An EGL implementation that uses the Vulkan HAL to provide OpenGL ES |
| mesa | mesa | Typically for targets that supports 3D acceleration |

### TARGET_GRAPHICS_VULKAN
| Value | Directory | Description |
|-------|-----------|-------------|
| mesa | mesa | Typically for targets that supports Vulkan acceleration |
| swiftshader | swiftshader | For targets without Vulkan support |

## Graphics HALs

### TARGET_GRAPHICS_ALLOCATOR_HAL
| Value | Directory | Description |
|-------|-----------|-------------|
| default-hidl-2.0 | graphics-allocator-hal_default-hidl-2.0 | Supports framebuffer display |
| gbm | gbm_gralloc | Android gralloc module using libgbm API from Mesa |
| minigbm | minigbm | May require additional build flags |

### TARGET_GRAPHICS_COMPOSER_HAL
| Value | Directory | Description |
|-------|-----------|-------------|
| default-hidl-2.2 | graphics-composer-hal_default-hidl-2.2 | Supports framebuffer display |
| drm_hwcomposer | drm_hwcomposer | Generic DRM HWComposer |

### TARGET_MEMTRACK_HAL
| Value | Directory | Description |
|-------|-----------|-------------|
| default-aidl | memtrack-hal_default-aidl | |

## Health

### TARGET_HEALTH_HAL
| Value | Directory | Description |
|-------|-----------|-------------|
| cuttlefish | health-hal_cuttlefish | For devices without battery |
| default-aidl | health-hal_default-aidl | For devices with a battery accessible through /sys/class/power_supply |

## Kernel

### TARGET_PREBUILT_KERNEL
| Value | Directory | Description |
|-------|-----------|-------------|
| * | prebuilt_kernel | Path to the prebuilt kernel image |

### TARGET_KERNEL_MIXED_MODE
| Value | Directory | Description |
|-------|-----------|-------------|
| true | prebuilt_kernel | Kernel was built in gki mixed mode |
| false | prebuilt_kernel | Kernel was not built in gki mixed mode, requiring module signature workarounds |

## Light

### TARGET_LIGHT_HAL
| Value | Directory | Description |
|-------|-----------|-------------|
| lineage | light-hal_lineage | Supports most of generic backlight and LED devices |

## Power

### TARGET_POWER_HAL
| Value | Directory | Description |
|-------|-----------|-------------|
| default-aidl | power-hal_default-aidl | |
| perfmgr-lineage | power-hal_perfmgr-lineage | Lineage perfmgr hal, requires device to provide powerhint.json file as module with the filename being module name. |

### TARGET_SUPPORTS_SUSPEND
| Value | Directory | Description |
|-------|-----------|-------------|
| false | suspend_blocker | Disables suspend |

## Security

### TARGET_GATEKEEPER_HAL
| Value | Directory | Description |
|-------|-----------|-------------|
| software-aidl | gatekeeper-hal_software-aidl | |

### TARGET_SECURITY_KEYMINT_HAL
| Value | Directory | Description |
|-------|-----------|-------------|
| default | keymint-hal_default | |

## USB

### TARGET_USB_HAL
| Value | Directory | Description |
|-------|-----------|-------------|
| lineage-basic | usb-hal_lineage | |
| lineage-dual_role_usb | usb-hal_lineage | |
| lineage-typec | usb-hal_lineage | |

### TARGET_USB_GADGET_HAL
| Value | Directory | Description |
|-------|-----------|-------------|
| mainline | usb-gadget-hal_mainline | |

### TARGET_USB_INIT_SCRIPT
| Value | Directory | Description |
|-------|-----------|-------------|
| mainline | usb-init-script_mainline | |
