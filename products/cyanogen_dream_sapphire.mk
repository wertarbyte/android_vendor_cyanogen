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

$(call inherit-product, vendor/cyanogen/products/cyanogen.mk)

USE_CAMERA_STUB := false

PRODUCT_NAME := cyanogen_dream_sapphire
PRODUCT_BRAND := htc
PRODUCT_DEVICE := dream_sapphire
PRODUCT_MODEL := Dream/Sapphire
PRODUCT_MANUFACTURER := HTC

PRODUCT_PACKAGES += \
    Stk

ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-$(shell date +%m%d%Y)-NIGHTLY-DS
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-5.0.7-test0
endif

include vendor/htc/dream_sapphire/device_dream_sapphire.mk

