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
    
PRODUCT_NAME := cyanogen_sholes
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := sholes-open
PRODUCT_MODEL := Droid
PRODUCT_MANUFACTURER := Motorola
PRODUCT_BUILD_PROP_OVERRIDES := BUILD_ID=ERE25 BUILD_DISPLAY_ID="voles-userdebug 2.1 ERE25 23960 test-keys" PRODUCT_NAME=voles TARGET_DEVICE=sholes BUILD_FINGERPRINT=verizon/voles/sholes/sholes:2.0.1/ESD56/20996:user/release-keys PRODUCT_BRAND=verizon

INCLUDE_BOTH_LAUNCHERS := true

PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/sholes-open/media/bootanimation.zip:system/media/bootanimation.zip

include vendor/motorola/sholes-open/device_sholes.mk
