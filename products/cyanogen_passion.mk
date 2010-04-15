#
# Copyright (C) 2009 The Android Open Source Project
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

# This is the top-level configuration for a US-configured CyanogenMod build

$(call inherit-product, vendor/cyanogen/products/cyanogen_hdpi.mk)

PRODUCT_NAME := cyanogen_passion
PRODUCT_BRAND := google
PRODUCT_DEVICE := passion
PRODUCT_MODEL := Nexus One
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=EPE54B BUILD_DISPLAY_ID=EPE54B PRODUCT_NAME=passion BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.1-update1/ERE27/24178:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.1-update1 ERE27 24178 release-keys"

PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/passion/media/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_PACKAGES += \
    Stk

ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-$(shell date +%m%d%Y)-NIGHTLY-N1
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-5.0.6-N1
endif

TARGET_KERNEL_CONFIG := cyanogen_mahimahi_defconfig

include vendor/google/passion/device_passion.mk
