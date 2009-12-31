LOCAL_PATH:= $(call my-dir)

# the library
# ============================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
            $(call all-subdir-java-files)

LOCAL_MODULE := com.cyanogenmod.android

LOCAL_JAVA_LIBRARIES := core framework

include $(BUILD_JAVA_LIBRARY)
