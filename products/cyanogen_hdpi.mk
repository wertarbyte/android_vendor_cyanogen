$(call inherit-product, vendor/cyanogen/products/cyanogen.mk)

PRODUCT_NAME := cyanogen_hdpi
PRODUCT_BRAND := cyanogen
PRODUCT_DEVICE := generic

# Allow Bionic to use NEON memcpy implementation
ALLOW_LGPL := true

# Let's grab the hdpi versions of apps and some extras
PRODUCT_PACKAGES += \
    Launcher2 \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers

# Build WebKit with V8
#JS_ENGINE:=v8

# Enable animated GIF in WebKit
ENABLE_ANIMATED_GIF:=true

# Pick up some sounds
include frameworks/base/data/sounds/OriginalAudio.mk
include frameworks/base/data/sounds/AudioPackage4.mk

ifdef CYANOGEN_WITH_GOOGLE
    PRODUCT_COPY_FILES += \
        vendor/cyanogen/proprietary/CarDock.apk:system/app/CarDock.apk \
        vendor/cyanogen/proprietary/Facebook.apk:system/app/Facebook.apk \
        vendor/cyanogen/proprietary/GenieWidget.apk:system/app/GenieWidget.apk \
        vendor/cyanogen/proprietary/GoogleGoggles.apk:system/app/GoogleGoggles.apk \
        vendor/cyanogen/proprietary/googlevoice.apk:system/app/googlevoice.apk \
        vendor/cyanogen/proprietary/HtcCopyright.apk:system/app/HtcCopyright.apk \
        vendor/cyanogen/proprietary/PassionQuickOffice.apk:system/app/PassionQuickOffice.apk \
        vendor/cyanogen/proprietary/libinterstitial.so:system/lib/libinterstitial.so
endif


PRODUCT_LOCALES += hdpi
