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

PRODUCT_NAME := cyanogen_bravo
PRODUCT_BRAND := htc_wwe
PRODUCT_DEVICE := bravo
PRODUCT_MODEL := HTC Desire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=ERE27 BUILD_DISPLAY_ID=ERE27 PRODUCT_NAME=htc_bravo BUILD_FINGERPRINT=htc_wwe/htc_bravo/bravo/bravo:2.1-update1/ERE27/155070:user/release-keys PRIVATE_BUILD_DESC="bravo-user 2.1-update1 ERE27 24178 release-keys"

PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/bravo/media/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_PACKAGES += \
    Stk

ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-5-$(shell date +%m%d%Y)-NIGHTLY-N1
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-5.0.8-bravo-test5
endif

include vendor/htc/bravo/device_bravo.mk
