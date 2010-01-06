LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

scripts := \
    00banner \
    01sysctl \
    03firstboot \
    04apps2sd \
    05userinit \
    99complete 

installed_scripts := \
    $(addprefix $(TARGET_OUT)/etc/init.d/,$(scripts))
$(installed_scripts) : PRIVATE_MODULE := system_etcdir
$(installed_scripts) : $(TARGET_OUT)/etc/init.d/% : $(LOCAL_PATH)/% | $(ACP)
    $(transform-prebuilt-to-target)
ALL_PREBUILT += $(installed_scripts)
