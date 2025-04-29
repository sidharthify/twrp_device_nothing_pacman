### Custom Recovery Tree for the Nothing Phone 2a (pacman)

```
# SPDX-License-Identifier: Apache-2.0
```

#### The Linux Kernel binary and it's accompanying modules are provided by [Nothing Technology Limited](https://github.com/NothingOSS) under the GNU Public License


=========================================

The Nothing Phone 2A (codenamed _"pacman"_) is a mid-range smartphone from Nothing released in early 2024.
![Nothing Phone 2A](https://nothing.tech/cdn/shop/products/black-1.png?v=1709369796)

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | 2 x 2.8GHz Cortex-A715 +6 x Cortex-A510
Chipset | Mediatek Dimensity 7200+
GPU     | Mali-G610 MC6
Memory  | 8/12 GB RAM
Shipped Android Version | 14
Storage | 128/256 GB
Battery | Li-Po 5000 mAh, non-removable
Display | 1080 x 2412 pixels, 6.7 inches, 60/120 hz

## After you've built a custom recovery using this tree, you can enter the following command in fastboot to flash it (yes, the recovery is stored in `vendor_boot`)

```
fastboot flash vendor_boot vendor_boot.img
```
