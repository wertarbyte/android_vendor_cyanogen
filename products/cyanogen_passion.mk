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

PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Ring_Synth_04.ogg \
    ro.config.notification_sound=pixiedust.ogg \
    ro.config.alarm_alert=Alarm_Classic.ogg \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.config.ringtone=CaribbeanIce.ogg \
    ro.com.google.clientidbase=android-google \
    keyguard.no_require_sim=true \
    ro.setupwizard.mode=OPTIONAL \
    ro.media.enc.hprof.file.format=mp4 \
    ro.media.enc.hprof.codec.vid=m4v \
    ro.media.enc.hprof.codec.aud=amrnb \
    ro.media.enc.hprof.vid.width=720 \
    ro.media.enc.hprof.vid.height=480 \
    ro.media.enc.hprof.vid.fps=24 \
    ro.media.enc.hprof.vid.bps=2000000 \
    ro.media.enc.hprof.aud.bps=12200 \
    ro.media.enc.hprof.aud.hz=8000 \
    ro.media.enc.hprof.aud.ch=1 \
    ro.media.enc.hprof.duration=60 \
    ro.media.enc.lprof.file.format=3gp \
    ro.media.enc.lprof.codec.vid=m4v \
    ro.media.enc.lprof.codec.aud=amrnb \
    ro.media.enc.lprof.vid.width=176 \
    ro.media.enc.lprof.vid.height=144 \
    ro.media.enc.lprof.vid.fps=15 \
    ro.media.enc.lprof.vid.bps=256000 \
    ro.media.enc.lprof.aud.bps=12200 \
    ro.media.enc.lprof.aud.hz=8000 \
    ro.media.enc.lprof.aud.ch=1 \
    ro.media.enc.lprof.duration=30 \
    ro.media.enc.file.format=3gp,mp4 \
    ro.media.enc.vid.codec=m4v,h263 \
    ro.media.enc.aud.codec=amrnb \
    ro.media.enc.vid.h263.width=176,800 \
    ro.media.enc.vid.h263.height=144,480 \
    ro.media.enc.vid.h263.bps=64000,1000000 \
    ro.media.enc.vid.h263.fps=1,24 \
    ro.media.enc.vid.m4v.width=176,800 \
    ro.media.enc.vid.m4v.height=144,480 \
    ro.media.enc.vid.m4v.bps=64000,2000000 \
    ro.media.enc.vid.m4v.fps=1,24 \
    ro.media.enc.aud.amrnb.bps=5525,12200 \
    ro.media.enc.aud.amrnb.hz=8000,8000 \
    ro.media.enc.aud.amrnb.ch=1,1 \
    ro.media.dec.aud.wma.enabled=0 \
    ro.media.dec.vid.wmv.enabled=0 \
    ro.media.cam.preview.fps=0 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.media.enc.jpeg.quality=90,80,70 \
    media.a1026.nsForVoiceRec=0 \
    media.a1026.enableA1026=1 \
    dalvik.vm.dexopt-flags=m=y \
    net.bt.name=Android \
    ro.config.sync=yes \
    dalvik.vm.stack-trace-file=/data/anr/traces.txt

include vendor/google/passion/device_passion.mk
