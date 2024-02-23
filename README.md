# Boot Fimware Snap for the MediaTek Genio board

This repository contains the boot firmware snap for the MediaTek Genio board.
This snap contains all boot firmware required for the MediaTek Genio board.

## Naming Convention

The name of boot firmware snaps must follow the rule below.

Snap name: boot-fw-{BOARD-VENDOR}-{BOARD-NAME}-{BOARD-VER}

Examples:  
boot-fw-mtk-g1200evk-p1v2  
boot-fw-mtk-g1200evkufs-p1v2  
boot-fw-mtk-g700evk-p1v3  
boot-fw-mtk-g350evk-p1v3  

The SKU Number field of System Information (Type 1) in SMBIOS should
contain boot firmware snap name.

SKU Number: {BOARD-VENDOR}-{BOARD-NAME}-{BOARD-VER}

Example:  
$ sudo dmidecode  
...  
Handle 0x0001, DMI type 1, 27 bytes  
System Information  
        Manufacturer: MediaTek  
        Product Name: Genio 1200 EVK P1V2  
        Version: Not Specified  
        Serial Number: Not Specified  
        UUID: Not Settable  
        Wake-up Type: Reserved  
        SKU Number: mtk-g1200evk-p1v2  

SMBIOS Specifications: https://www.dmtf.org/standards/smbios  
How to generate SMBIOS tables in U-Boot: https://docs.u-boot.org/en/latest/develop/smbios.html

## Directory Hierarchy
<pre>
├── boot-firmware (Pre-built boot firmware)
│   ├── bl2.img
│   ├── bootassets.vfat (Boot logo)
│   ├── fip.bin (bl31.bin, tee.bin and u-boot.bin)
│   ├── firmware.vfat (Device tree)
│   ├── lk.bin (Flash agent)
│   └── u-boot-initial-env
├── copyright  (Copyright files for boot firmware)
│   ├── copyright.arm-trusted-firmware
│   ├── copyright.lk
│   ├── copyright.optee_os
│   └── copyright.u-boot
├── README
├── snap
│   └── snapcraft.yaml (Default build script: All the details the snapcraft command needs to build a snap)
└── snap-build
    └── snapcraft-snap-build.yaml (All the details the snapcraft command needs to build boot firmware)
</pre>
## How To Create Boot Firmware Snap For Your board

1. Fork this branch.

2. Replace boot fimware in /boot-firmware with pre-built boot firmware of your board.

3. Update snap/snapcraft.yaml accordingly.
   Please update fields in snap/snapcraft.yaml: name, version, summary, description, etc

4. Register your boot firmware snap
   
   ```no-highlight
   # Register boot firmware snap (Only need to do it once)
   $ sudo snap install snapcraft
   $ snapcraft login
   $ snapcraft register boot-fw-${BAORD-VENDOR}-${BOARD-NAME}-${BOARD-VER}
   ```

5. Contact Canonical Devices Field team for snap review and track creation.

6. Build and upload your firmware snap to store
   
   ```no-highlight
   # Build boot firmware snap
   $ snapcraft
   
   # Upload boot firmware snap to the public store
   $ snapcraft upload boot-fw-${BAORD-VENDOR}-${BOARD-NAME}-${BOARD-VER}_${SNAP-VER}_arm64.snap --release=22/candidate
   
   # Release your snap to stable channel after it's verified.
   # Get revision from https://dashboard.snapcraft.io/snaps/${YOUR_SNAP_NAME}
   $ snapcraft release boot-fw-${BAORD-VENDOR}-${BOARD-NAME}-${BOARD-VER} ${SNAP-REVISION} 22/stable
   ```
   
   For details, please see https://ubuntu.com/tutorials/create-your-first-snap#1-overview
