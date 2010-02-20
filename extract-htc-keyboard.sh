mkdir -p proprietary

adb pull system/lib/libt9.so proprietary
adb pull system/app/HTC_IME.apk proprietary
unzip -j -o proprietary/HTC_IME.apk lib/armeabi/libt9.so -d proprietary
zip -d proprietary/HTC_IME.apk lib/armeabi/libt9.so
