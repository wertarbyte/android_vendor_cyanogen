LOCAL_PATH:= $(call my-dir)

LOCAL_SRC_FILES := busybox
LOCAL_MODULE := busybox
LOCAL_MODULE_CLASS := OPTIONAL_EXECUTABLES

include $(BUILD_PREBUILT)

TOOLS := \
       [ \
       [[ \
       arping \
       ash \
       awk \
       basename \
       bbconfig \
       bunzip2 \
       bzcat \
       bzip2 \
       cat \
       catv \
       chgrp \
       chmod \
       chown \
       chroot \
       chrt \
       chvt \
       cksum \
       clear \
       cmp \
       cp \
       cpio \
       crond \
       crontab \
       cut \
       date \
       dc \
       dd \
       deallocvt \
       depmod \
       devmem \
       df \
       dhcprelay \
       diff \
       dirname \
       dmesg \
       dnsd \
       dnsdomainname \
       dos2unix \
       du \
       dumpkmap \
       dumpleases \
       echo \
       egrep \
       env \
       ether-wake \
       expr \
       false \
       fbset \
       fdisk \
       fgrep \
       find \
       fold \
       free \
       freeramdisk \
       fuser \
       getopt \
       grep \
       gunzip \
       gzip \
       head \
       hexdump \
       hostname \
       hwclock \
       ifconfig \
       ifdown \
       ifup \
       insmod \
       install \
       ionice \
       ip \
       ipaddr \
       iplink \
       iproute \
       iprule \
       iptunnel \
       kbd_mode \
       kill \
       killall \
       killall5 \
       last \
       length \
       less \
       ln \
       loadfont \
       loadkmap \
       losetup \
       ls \
       lsmod \
       makedevs \
       md5sum \
       mkdir \
       mkfifo \
       mknod \
       mkswap \
       mktemp \
       modprobe \
       more \
       mount \
       mountpoint \
       mv \
       nameif \
       nc \
       netstat \
       nice \
       nohup \
       nslookup \
       od \
       openvt \
       patch \
       pgrep \
       pidof \
       ping \
       pipe_progress \
       pivot_root \
       pkill \
       printenv \
       printf \
       ps \
       pwd \
       rdate \
       rdev \
       readlink \
       readprofile \
       realpath \
       renice \
       reset \
       rm \
       rmdir \
       rmmod \
       route \
       run-parts \
       sed \
       seq \
       setconsole \
       setkeycodes \
       setlogcons \
       setsid \
       sh \
       sha1sum \
       showkey \
       sleep \
       sort \
       split \
       stat \
       strings \
       stty \
       swapoff \
       swapon \
       switch_root \
       sync \
       sysctl \
       tac \
       tail \
       tar \
       tcpsvd \
       tee \
       telnet \
       telnetd \
       test \
       tftp \
       time \
       top \
       touch \
       tr \
       traceroute \
       true \
       tty \
       udhcpd \
       udpsvd \
       umount \
       uname \
       uniq \
       unix2dos \
       unzip \
       uptime \
       usleep \
       uudecode \
       uuencode \
       vconfig \
       vi \
       watch \
       wc \
       wget \
       which \
       who \
       whoami \
       xargs \
       yes \
       zcat

SYMLINKS := $(addprefix $(TARGET_OUT)/xbin/,$(TOOLS))
$(SYMLINKS): BUSYBOX_BINARY := $(LOCAL_MODULE)
$(SYMLINKS): $(LOCAL_INSTALLED_MODULE) $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> $(BUSYBOX_BINARY)"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf $(BUSYBOX_BINARY) $@

ALL_DEFAULT_INSTALLED_MODULES += $(SYMLINKS)

# We need this so that the installed files could be picked up based on the
# local module name
ALL_MODULES.$(LOCAL_MODULE).INSTALLED := \
    $(ALL_MODULES.$(LOCAL_MODULE).INSTALLED) $(SYMLINKS)

