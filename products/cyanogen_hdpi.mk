#$(call inherit-product, build/target/product/generic.mk)

TARGET_OTA_SCRIPT_MODE=edify

# Manually set the policy and PRODUCT_PACKAGES so we can tweak them 
# depending on whether or not we build with Google. There is no way
# to override PRODUCT_PACKAGES from an inheriting product yet.

# build/target/product.core.mk
PRODUCT_POLICY := android.policy_phone

PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=cyanogenmod

PRODUCT_PACKAGES += \
    framework-res \
    Browser \
    Contacts \
    Launcher \
    HTMLViewer \
    Phone \
    ApplicationsProvider \
    ContactsProvider \
    DownloadProvider \
    MediaProvider \
    PicoTts \
    SettingsProvider \
    TelephonyProvider \
    TtsService \
    VpnServices \
    UserDictionaryProvider \
    PackageInstaller \
    Bugreport

# end core.mk

# build/target/product/generic.mk
PRODUCT_PACKAGES += \
    AccountAndSyncSettings \
    AlarmClock \
    AlarmProvider \
    Bluetooth \
    Calculator \
    Calendar \
    Camera \
    CertInstaller \
    DrmProvider \
    Email \
    Gallery \
    Mms \
    Music \
    Settings \
    Sync \
    Updater \
    CalendarProvider \
    SyncProvider
# end generic.mk

PRODUCT_NAME := cyanogen_hdpi
PRODUCT_BRAND := cyanogen
PRODUCT_DEVICE := generic

USE_CAMERA_STUB := false

# Let's grab the hdpi versions of apps and some extras
PRODUCT_PACKAGES += \
    DeskClock \
    DownloadProvider \
    Gallery3D \
    GlobalSearch \
    Launcher2 \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    SoundRecorder \
    VisualizationWallpapers \
    VoiceDialer \
    libRS \
    librs_jni

PRODUCT_PACKAGES += Superuser 

PRODUCT_PACKAGE_OVERLAYS := vendor/cyanogen/overlay

# Build WebKit with V8
#JS_ENGINE:=v8

# Enable animated GIF in WebKit
ENABLE_ANIMATED_GIF:=true

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

# Pick up some sounds
include frameworks/base/data/sounds/OriginalAudio.mk
include frameworks/base/data/sounds/AudioPackage4.mk

TARGET_OTA_BACKUPTOOL=True

PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/cyanogen/prebuilt/common/etc/dnsmasq.conf:system/etc/dnsmasq.conf \
	vendor/cyanogen/prebuilt/common/etc/e2fsck.conf:system/etc/e2fsck.conf \
    vendor/cyanogen/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/cyanogen/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/cyanogen/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/cyanogen/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/cyanogen/prebuilt/common/etc/init.d/04modules:system/etc/init.d/04modules \
    vendor/cyanogen/prebuilt/common/etc/init.d/05mountsd:system/etc/init.d/05mountsd \
    vendor/cyanogen/prebuilt/common/etc/init.d/10apps2sd:system/etc/init.d/10apps2sd \
    vendor/cyanogen/prebuilt/common/etc/init.d/20userinit:system/etc/init.d/20userinit \
    vendor/cyanogen/prebuilt/common/etc/init.d/99complete:system/etc/init.d/99complete \
    vendor/cyanogen/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/cyanogen/prebuilt/common/bin/usb-tether:system/bin/usb-tether \
    vendor/cyanogen/prebuilt/common/bin/shutdown:system/bin/shutdown \
    vendor/cyanogen/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/cyanogen/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/cyanogen/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh \
	vendor/cyanogen/prebuilt/common/xbin/dropbear-keygen:system/xbin/dropbear-keygen

# Various prebuilt stuff that hasen't been android-ized yet
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/common/lib/libncurses.so:system/lib/libncurses.so \
    vendor/cyanogen/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/cyanogen/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/cyanogen/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/cyanogen/prebuilt/common/etc/profile:system/etc/profile \
    vendor/cyanogen/prebuilt/common/xbin/bash:system/xbin/bash \
    vendor/cyanogen/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/cyanogen/prebuilt/common/xbin/irssi:system/xbin/irssi \
    vendor/cyanogen/prebuilt/common/xbin/lsof:system/xbin/lsof \
    vendor/cyanogen/prebuilt/common/xbin/nano:system/xbin/nano \
    vendor/cyanogen/prebuilt/common/xbin/powertop:system/xbin/powertop

ifdef CYANOGEN_WITH_HTC_KEYBOARD
    PRODUCT_COPY_FILES += \
        vendor/cyanogen/proprietary/HTC_IME.apk:system/app/HTC_IME.apk \
        vendor/cyanogen/proprietary/libt9.so:system/lib/libt9.so
endif

ifdef CYANOGEN_WITH_GOOGLE
    TARGET_OTA_BACKUPTOOL=False

    PRODUCT_COPY_FILES += \
        vendor/cyanogen/proprietary/BugReport.apk:system/app/BugReport.apk \
        vendor/cyanogen/proprietary/CarDock.apk:system/app/CarDock.apk \
        vendor/cyanogen/proprietary/com.amazon.mp3.apk:system/app/com.amazon.mp3.apk \
        vendor/cyanogen/proprietary/EnhancedGoogleSearchProvider.apk:system/app/EnhancedGoogleSearchProvider.apk \
        vendor/cyanogen/proprietary/Facebook.apk:system/app/Facebook.apk \
        vendor/cyanogen/proprietary/GenieWidget.apk:system/app/GenieWidget.apk \
        vendor/cyanogen/proprietary/Gmail.apk:system/app/Gmail.apk \
        vendor/cyanogen/proprietary/GmailProvider.apk:system/app/GmailProvider.apk \
        vendor/cyanogen/proprietary/GoogleApps.apk:system/app/GoogleApps.apk \
        vendor/cyanogen/proprietary/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
        vendor/cyanogen/proprietary/GoogleCheckin.apk:system/app/GoogleCheckin.apk \
        vendor/cyanogen/proprietary/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
        vendor/cyanogen/proprietary/GoogleGoggles.apk:system/app/GoogleGoggles.apk \
        vendor/cyanogen/proprietary/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
        vendor/cyanogen/proprietary/GoogleSettingsProvider.apk:system/app/GoogleSettingsProvider.apk \
        vendor/cyanogen/proprietary/GoogleSubscribedFeedsProvider.apk:system/app/GoogleSubscribedFeedsProvider.apk \
        vendor/cyanogen/proprietary/googlevoice.apk:system/app/googlevoice.apk \
        vendor/cyanogen/proprietary/gtalkservice.apk:system/app/gtalkservice.apk \
        vendor/cyanogen/proprietary/HtcCopyright.apk:system/app/HtcCopyright.apk \
        vendor/cyanogen/proprietary/LatinImeTutorial.apk:system/app/LatinImeTutorial.apk \
        vendor/cyanogen/proprietary/Maps.apk:system/app/Maps.apk \
        vendor/cyanogen/proprietary/MarketUpdater.apk:system/app/MarketUpdater.apk \
        vendor/cyanogen/proprietary/MediaUploader.apk:system/app/MediaUploader.apk \
        vendor/cyanogen/proprietary/NetworkLocation.apk:system/app/NetworkLocation.apk \
        vendor/cyanogen/proprietary/PassionQuickOffice.apk:system/app/PassionQuickOffice.apk \
        vendor/cyanogen/proprietary/SetupWizard.apk:system/app/SetupWizard.apk \
        vendor/cyanogen/proprietary/Street.apk:system/app/Street.apk \
        vendor/cyanogen/proprietary/Talk.apk:system/app/Talk.apk \
        vendor/cyanogen/proprietary/TalkProvider.apk:system/app/TalkProvider.apk \
        vendor/cyanogen/proprietary/Vending.apk:system/app/Vending.apk \
        vendor/cyanogen/proprietary/VoiceSearchWithKeyboard.apk:system/app/VoiceSearchWithKeyboard.apk \
        vendor/cyanogen/proprietary/YouTube.apk:system/app/YouTube.apk \
        vendor/cyanogen/proprietary/com.google.android.datamessaging.xml:system/etc/permissions/com.google.android.datamessaging.xml \
        vendor/cyanogen/proprietary/com.google.android.gtalkservice.xml:system/etc/permissions/com.google.android.gtalkservice.xml \
        vendor/cyanogen/proprietary/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
        vendor/cyanogen/proprietary/com.google.android.gtalkservice.jar:system/framework/com.google.android.gtalkservice.jar \
        vendor/cyanogen/proprietary/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
        vendor/cyanogen/proprietary/libgtalk_jni.so:system/lib/libgtalk_jni.so \
        vendor/cyanogen/proprietary/libinterstitial.so:system/lib/libinterstitial.so
else    
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch \
        LatinIME
endif


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
