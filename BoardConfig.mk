LOCAL_PATH           := device/allwinner/astar
USE_CAMERA_STUB      := true

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

#include device/allwinner/polaris-common/BoardConfigCommon.mk

TARGET_CPU_ABI                          := armeabi-v7a
TARGET_CPU_ABI2                         := armeabi
TARGET_CPU_SMP                          := true
TARGET_CPU_VARIANT                      := cortex-a7
TARGET_ARCH                             := arm
TARGET_ARCH_VARIANT                     := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER              := true
TARGET_USE_NEON_OPTIMIZATION            := true
TARGET_ARCH_LOWMEM                      := false
TARGET_BOARD_PLATFORM                   := polaris
TARGET_BOOTLOADER_BOARD_NAME            := exdroid
CEDARX_USE_ION_MEM_ALLOCATOR            := true

BOARD_EGL_CFG                           := $(LOCAL_PATH)/egl/egl.cfg
# COMMON_GLOBAL_CFLAGS                    += -DWORKAROUND_BUG_10194508
BOARD_EGL_WORKAROUND_BUG_10194508       := true
USE_OPENGL_RENDERER                     := true
ENABLE_WEBGL                            := true
BOARD_USE_SKIA_LCDTEXT                  := true
BOARD_EGL_NEEDS_LEGACY_FB               := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER   := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK   := true
# TARGET_PROVIDES_INIT_RC                 := true
TARGET_KERNEL_ARCH                      := arm
BOARD_KERNEL_CMDLINE                    := console=ttyS0,115200 rw init=/init loglevel=4
BOARD_KERNEL_BASE                       := 0x40000000
BOARD_KERNEL_PAGESIZE                   := 2048
BOARD_KERNEL_OFFSET                     := 0x00008000
BOARD_KERNEL_SIZE                       := 10166424
BOARD_RAMDISK_SIZE                      := 2258420
BOARD_RAMDISK_OFFSET                    := 0x01000000
BOARD_KERNEL_TAGS_OFFSET                := 0x00000100
BOARD_RAMDISK_COMP                      := gzip

SW_BOARD_TOUCH_RECOVERY                 := true
RECOVERY_FSTAB_VERSION                  := 2
BOARD_PCB_VERSION                       := V3.0
DEVICE_RESOLUTION                       := 1024x600

#recovery
#TARGET_RECOVERY_UI_LIB := librecovery_ui_astar_y3
# RECOVERY_SDCARD_ON_DATA                 := false
BOARD_USE_USB_MASS_STORAGE_SWITCH       := true
BOARD_SDCARD_DEVICE_PRIMARY             := /dev/block/by-name/UDISK
BOARD_HAS_SDCARD_INTERNAL               := true
BOARD_SDCARD_DEVICE_INTERNAL            := /dev/block/by-name/UDISK
BOARD_SDEXT_DEVICE                      := /dev/block/mmcblk0p1

TARGET_NO_BOOTLOADER                    := true
TARGET_NO_RECOVERY                      := false
TARGET_NO_KERNEL                        := false

# wifi and bt configuration
# 1. Wifi Configuration
# 1.1 realtek wifi support 
# 1.1  realtek wifi configuration
BOARD_WIFI_VENDOR := realtek
ifeq ($(BOARD_WIFI_VENDOR), realtek)
    WPA_SUPPLICANT_VERSION := VER_0_8_X
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
    BOARD_HOSTAPD_DRIVER        := NL80211
    BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_rtl

    SW_BOARD_USR_WIFI := rtl8188eu
    BOARD_WLAN_DEVICE := rtl8188eu

    #SW_BOARD_USR_WIFI := rtl8723au
    #BOARD_WLAN_DEVICE := rtl8723au
    
    #SW_BOARD_USR_WIFI := rtl8723bs
    #BOARD_WLAN_DEVICE := rtl8723bs
endif

# 2. Bluetooth Configuration
# make sure BOARD_HAVE_BLUETOOTH is true for every bt vendor
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/allwinner/astar/bluetooth
BOARD_HAVE_BLUETOOTH_NAME              := rtl8723bs
BOARD_HAVE_BLUETOOTH_RTK               := true
BLUETOOTH_HCI_USE_RTK_H5               := true
TARGET_USE_BOOSTUP_OPZ                 := true

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE         := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE     := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE       := 791674880
BOARD_USERDATAIMAGE_PARTITION_SIZE     := 1055916032
BOARD_FLASH_BLOCK_SIZE                 := 131072

TARGET_SCREEN_HEIGHT                   := 600
TARGET_SCREEN_WIDTH                    := 1024
BOARD_HAS_NO_SELECT_BUTTON             := true
