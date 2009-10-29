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

$(call inherit-product, vendor/aosp/products/aosp_dream_us.mk)

PRODUCT_NAME := cyanogen_dream_us

PRODUCT_PACKAGES += Superuser

PRODUCT_COPY_FILES += vendor/cyanogen/etc/apns-conf.xml:system/etc/apns-conf.xml \
                      vendor/cyanogen/etc/dnsmasq.conf:system/etc/dnsmasq.conf \
                      vendor/cyanogen/etc/fstab:system/etc/fstab \
                      vendor/cyanogen/etc/sysctl.conf:system/etc/sysctl.conf \
                      vendor/cyanogen/etc/init.d/00banner:system/etc/init.d/00banner \
                      vendor/cyanogen/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
                      vendor/cyanogen/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
                      vendor/cyanogen/etc/init.d/04apps2sd:system/etc/init.d/04apps2sd \
                      vendor/cyanogen/etc/init.d/05userinit:system/etc/init.d/05userinit \
                      vendor/cyanogen/etc/init.d/99complete:system/etc/init.d/99complete \
                      vendor/cyanogen/bin/fix_permissions:system/bin/fix_permissions \
                      vendor/cyanogen/bin/usb-tether:system/bin/usb-tether \
		      vendor/cyanogen/bin/shutdown:system/bin/shutdown

