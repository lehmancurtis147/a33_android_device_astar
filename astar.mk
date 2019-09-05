$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
#$(call inherit-product, device/allwinner/astar-common/rild/astar_3gdongle.mk)

# google pinyin
PRODUCT_PACKAGES += GooglePinyin

# init.rc, kernel
PRODUCT_COPY_FILES += \
	device/allwinner/astar/modules/modules/nand.ko:root/nand.ko \
	device/allwinner/astar/init.sun8i.rc:root/init.sun8i.rc \
	device/allwinner/astar/ueventd.sun8i.rc:root/ueventd.sun8i.rc \
	device/allwinner/astar/initlogo.rle:root/initlogo.rle  \
	device/allwinner/astar/media/bootanimation.zip:system/media/bootanimation.zip \
	device/allwinner/astar/media/boot.wav:system/media/boot.wav \
	device/allwinner/astar/media/bootlogo.bmp:system/media/bootlogo.bmp \
	device/allwinner/astar/media/initlogo.bmp:system/media/initlogo.bmp \
	device/allwinner/astar/fstab.sun8i:root/fstab.sun8i \
	device/allwinner/astar/init.recovery.sun8i.rc:root/init.recovery.sun8i.rc

# wifi features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

#key and tp config file
PRODUCT_COPY_FILES += \
	device/allwinner/astar/configs/sunxi-keyboard.kl:system/usr/keylayout/sunxi-keyboard.kl \
	device/allwinner/astar/configs/tp.idc:system/usr/idc/tp.idc \
	device/allwinner/astar/configs/gsensor.cfg:system/usr/gsensor.cfg

#copy touch and keyboard driver to recovery randisk
PRODUCT_COPY_FILES += \
    device/allwinner/astar/modules/modules/disp.ko:obj/disp.ko \
    device/allwinner/astar/modules/modules/sunxi-keyboard.ko:obj/sunxi-keyboard.ko \
    device/allwinner/astar/modules/modules/lcd.ko:obj/lcd.ko \
    device/allwinner/astar/modules/modules/gt82x.ko:obj/gt82x.ko \
    device/allwinner/astar/modules/modules/gt818_ts.ko:obj/gt818_ts.ko \
    device/allwinner/astar/modules/modules/ft5x_ts.ko:obj/ft5x_ts.ko \
    device/allwinner/astar/modules/modules/sw-device.ko:obj/sw-device.ko

# ap6181/6210/6330 sdio wifi fw and nvram
#$(call inherit-product-if-exists, hardware/broadcom/wlan/firmware/ap6181/device-bcm.mk)
#$(call inherit-product-if-exists, hardware/broadcom/wlan/firmware/ap6210/device-bcm.mk)
#$(call inherit-product-if-exists, hardware/broadcom/wlan/firmware/ap6330/device-bcm.mk)

#rtl8723bs bt fw and config
$(call inherit-product, hardware/realtek/bluetooth/rtl8723bs/firmware/rtlbtfw_cfg.mk)

#esp8089 wifi firmware
#$(call inherit-product-if-exists, hardware/espressif/wlan/firmware/esp8089/device-esp.mk)

#vold config
PRODUCT_COPY_FILES += \
	device/allwinner/astar/recovery.fstab:recovery.fstab 
# camera
PRODUCT_COPY_FILES += \
	device/allwinner/astar/configs/camera.cfg:system/etc/camera.cfg \
	device/allwinner/astar/configs/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml 

# camera config for camera detector
PRODUCT_COPY_FILES += \
	device/allwinner/astar/hawkview/sensor_list_cfg.ini:system/etc/hawkview/sensor_list_cfg.ini

#add gms features
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
        frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml 

# 3G Data Card Packages
PRODUCT_PACKAGES += \
	u3gmonitor \
	chat \
	rild \
	pppd

# 3G Data Card Configuration Flie
PRODUCT_COPY_FILES += \
	device/allwinner/astar-common/rild/ip-down:system/etc/ppp/ip-down \
	device/allwinner/astar-common/rild/ip-up:system/etc/ppp/ip-up \
	device/allwinner/astar-common/rild/3g_dongle.cfg:system/etc/3g_dongle.cfg \
	device/allwinner/astar-common/rild/usb_modeswitch:system/bin/usb_modeswitch \
	device/allwinner/astar-common/rild/call-pppd:system/xbin/call-pppd \
	device/allwinner/astar-common/rild/usb_modeswitch.sh:system/xbin/usb_modeswitch.sh \
	device/allwinner/astar-common/rild/apns-conf_sdk.xml:system/etc/apns-conf.xml \
	device/allwinner/astar-common/rild/libsoftwinner-ril.so:system/lib/libsoftwinner-ril.so
	
#PRODUCT_COPY_FILES += \
#	device/allwinner/astar-common/rild/init.3gdongle.rc:root/init.sunxi.3gdongle.rc

# 3G Data Card usb modeswitch File
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/allwinner/astar-common/rild/usb_modeswitch.d,system/etc/usb_modeswitch.d)

PRODUCT_PROPERTY_OVERRIDES += \
		    ro.sw.embeded.telephony = false

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.timezone=Asia/Shanghai \
	persist.sys.language=zh \
	persist.sys.country=CN

PRODUCT_PACKAGES += Bluetooth

PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.8723b_bt.used=true

#GPS Feature
#PRODUCT_PACKAGES +=  gps.astar
#BOARD_USES_GPS_TYPE := simulator
#PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml

# evb logger
PRODUCT_COPY_FILES += \
    device/allwinner/astar/tools/logger.sh:system/bin/logger.sh

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.storage_type = emulated \
	persist.sys.usb.config=mtp \
	ro.udisk.lable=astar \
	ro.font.scale=1.0 \
	ro.hwa.force=false \
	rw.logger=0 \
	ro.sys.bootfast=true \
	debug.hwc.showfps=0 \
	debug.hwui.render_dirty_regions=false

#for gms
PRODUCT_PROPERTY_OVERRIDES += \
        ro.sys.mutedrm=true \
        ro.adb.secure=0

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160 \
	ro.product.firmware=v2.0

$(call inherit-product-if-exists, device/allwinner/astar/modules/modules.mk)

DEVICE_PACKAGE_OVERLAYS := device/allwinner/astar/overlay
PRODUCT_CHARACTERISTICS := tablet

# Overrides
PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi large
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_BRAND  := Allwinner
PRODUCT_NAME   := astar
PRODUCT_DEVICE := astar
PRODUCT_MODEL  := QUAD-CORE A33 y3
PRODUCT_MANUFACTURER := allwinner

include device/allwinner/astar-common/prebuild/google/products/gms_base.mk
