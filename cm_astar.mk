#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Inherit device configuration
$(call inherit-product, device/allwinner/astar/astar.mk)

# Inherit some common CyanogenMod stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Release name
PRODUCT_RELEASE_NAME := astar

# Boot animation
TARGET_SCREEN_HEIGHT := 600
TARGET_SCREEN_WIDTH := 1024

# set locales & aapt config.
PRODUCT_LOCALES := ru_RU en_US de_DE fr_FR
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_AAPT_CONFIG := ldpi mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := astar
PRODUCT_NAME := cm_astar
PRODUCT_BRAND := astar
PRODUCT_MODEL := Q88H
PRODUCT_MANUFACTURER := allwinner

# Allow ADB (to access dev settings)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0 ro.secure=0 ro.allow.mock.location=1 service.adb.enable=1 persist.sys.usb.config=mass_storage ro.debuggable=1 persist.service.adb.enable=1 
