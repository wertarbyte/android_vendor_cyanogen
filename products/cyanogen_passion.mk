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

$(call inherit-product, vendor/google/passion/device_passion.mk)

USE_CAMERA_STUB := false

# Build the JIT, but disable it for right now because of stability issues
WITH_JIT := true
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.execution-mode=int:fast

PRODUCT_NAME := cyanogen_passion

PRODUCT_PACKAGES += Superuser 

PRODUCT_PACKAGE_OVERLAYS := vendor/cyanogen/overlay

	
PRODUCT_COPY_FILES += vendor/cyanogen/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
                      vendor/cyanogen/prebuilt/etc/dnsmasq.conf:system/etc/dnsmasq.conf \
                      vendor/cyanogen/prebuilt/etc/fstab:system/etc/fstab \
                      vendor/cyanogen/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf \
					  vendor/cyanogen/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
					  vendor/cyanogen/prebuilt/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
					  vendor/cyanogen/prebuilt/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
					  vendor/cyanogen/prebuilt/etc/init.d/05userinit:system/etc/init.d/05userinit \
					  vendor/cyanogen/prebuilt/etc/init.d/99complete:system/etc/init.d/99complete \
                      vendor/cyanogen/prebuilt/bin/fix_permissions:system/bin/fix_permissions \
                      vendor/cyanogen/prebuilt/bin/usb-tether:system/bin/usb-tether \
                      vendor/cyanogen/prebuilt/bin/shutdown:system/bin/shutdown \
					  vendor/cyanogen/prebuilt/bin/compcache:system/bin/compcache 

PRODUCT_LOCALES := \
    en_US \
	ar_EG \
	ar_IL \
	bg_BG \
	ca_ES \
	cs_CZ \
	da_DK \
	de_AT \
	de_CH \
	de_DE \
	de_LI \
	el_GR \
	en_AU \
	en_CA \
	en_GB \
	en_IE \
	en_IN \
	en_NZ \
	en_SG \
	en_ZA \
	es_ES \
	es_US \
	fi_FI \
	fr_BE \
	fr_CA \
	fr_CH \
	fr_FR \
	he_IL \
	hi_IN \
	hr_HR \
	hu_HU \
	id_ID \
	it_CH \
	it_IT \
	iw_IL \
	ja_JP \
	ko_KR \
	lt_LT \
	lv_LV \
	nb_NO \
	nl_BE \
	nl_NL \
	pl_PL \
	pt_BR \
	pt_PT \
	ro_RO \
	ru_RU \
	sk_SK \
	sl_SI \
	sr_RS \
	sv_SE \
	th_TH \
	tl_PH \
	tr_TR \
	uk_UA \
	vi_VN \
	zh_CN \
	zh_TW \
    hdpi
