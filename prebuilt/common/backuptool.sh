#!/sbin/sh
#
# Backup and restore proprietary Android system files
#

C=/cache
S=/system

backup_file() {
    if [ -e "$1" ];
    then
        if [ "$2" != "" ];
        then
            echo "$2  $1" | md5sum -c -
            if [ $? -ne 0 ];
            then
                echo "MD5Sum check for $1 failed!";
                exit $?;
            fi
        fi

        F=`basename $1`

        # dont backup any apps that have odex files, they are useless
        if ( echo $F | grep "\.apk$" > /dev/null ) && [ -e `echo $1 | sed -e "s/\.apk$/\.odex/g"` ];
        then
            echo "Skipping odexed apk $1";
        else    
            cp $1 $C/$F
        fi
    fi
}

restore_file() {
    FILE=`basename $1`
    DIR=`dirname $1`
    if [ -e "$C/$FILE" ];
    then
        if [ ! -d "$DIR" ];
        then
            mkdir -p $DIR;
        fi
        cp -p $C/$FILE $1;
        if [ "$2" != "" ];
        then
            rm $2;
        fi
    fi
}

case "$1" in
    backup)
        mount $S
        mount $C
        backup_file $S/app/BugReport.apk
        backup_file $S/app/CarDock.apk
        backup_file $S/app/com.amazon.mp3.apk
        backup_file $S/app/EnhancedGoogleSearchProvider.apk
        backup_file $S/app/Facebook.apk
        backup_file $S/app/GenieWidget.apk
        backup_file $S/app/Gmail.apk
        backup_file $S/app/GmailProvider.apk
        backup_file $S/app/GoogleApps.apk
        backup_file $S/app/GoogleBackupTransport.apk
        backup_file $S/app/GoogleCheckin.apk
        backup_file $S/app/GoogleContactsSyncAdapter.apk
        backup_file $S/app/GooglePartnerSetup.apk
        backup_file $S/app/GoogleSettingsProvider.apk
        backup_file $S/app/GoogleSubscribedFeedsProvider.apk
        backup_file $S/app/googlevoice.apk
        backup_file $S/app/gtalkservice.apk
        backup_file $S/app/HtcCopyright.apk
        backup_file $S/app/LatinImeTutorial.apk
        backup_file $S/app/Maps.apk
        backup_file $S/app/MarketUpdater.apk
        backup_file $S/app/MediaUploader.apk
        backup_file $S/app/NetworkLocation.apk
        backup_file $S/app/PassionQuickOffice.apk
        backup_file $S/app/SetupWizard.apk
        backup_file $S/app/Street.apk
        backup_file $S/app/Talk.apk
        backup_file $S/app/TalkProvider.apk
        backup_file $S/app/Vending.apk
        backup_file $S/app/VoiceSearchWithKeyboard.apk
        backup_file $S/app/YouTube.apk
        backup_file $S/etc/permissions/com.google.android.datamessaging.xml
        backup_file $S/etc/permissions/com.google.android.gtalkservice.xml
        backup_file $S/etc/permissions/com.google.android.maps.xml
        backup_file $S/framework/com.google.android.gtalkservice.jar
        backup_file $S/framework/com.google.android.maps.jar
        backup_file $S/lib/libgtalk_jni.so
        ;;
    restore)
        restore_file $S/app/BugReport.apk
        restore_file $S/app/CarDock.apk
        restore_file $S/app/com.amazon.mp3.apk
        restore_file $S/app/EnhancedGoogleSearchProvider.apk $S/app/GoogleSearch.apk
        restore_file $S/app/Facebook.apk
        restore_file $S/app/GenieWidget.apk
        restore_file $S/app/Gmail.apk
        restore_file $S/app/GmailProvider.apk
        restore_file $S/app/GoogleApps.apk
        restore_file $S/app/GoogleBackupTransport.apk
        restore_file $S/app/GoogleCheckin.apk
        restore_file $S/app/GoogleContactsSyncAdapter.apk
        restore_file $S/app/GooglePartnerSetup.apk
        restore_file $S/app/GoogleSettingsProvider.apk
        restore_file $S/app/GoogleSubscribedFeedsProvider.apk
        restore_file $S/app/googlevoice.apk
        restore_file $S/app/gtalkservice.apk
        restore_file $S/app/HtcCopyright.apk
        restore_file $S/app/LatinImeTutorial.apk
        restore_file $S/app/Maps.apk
        restore_file $S/app/MarketUpdater.apk
        restore_file $S/app/MediaUploader.apk
        restore_file $S/app/NetworkLocation.apk
        restore_file $S/app/PassionQuickOffice.apk
        restore_file $S/app/SetupWizard.apk $S/app/Provision.apk
        restore_file $S/app/Street.apk
        restore_file $S/app/Talk.apk
        restore_file $S/app/TalkProvider.apk
        restore_file $S/app/Vending.apk
        restore_file $S/app/VoiceSearchWithKeyboard.apk $S/app/LatinIME.apk
        restore_file $S/app/YouTube.apk
        restore_file $S/etc/permissions/com.google.android.datamessaging.xml
        restore_file $S/etc/permissions/com.google.android.gtalkservice.xml
        restore_file $S/etc/permissions/com.google.android.maps.xml
        restore_file $S/framework/com.google.android.gtalkservice.jar
        restore_file $S/framework/com.google.android.maps.jar
        restore_file $S/lib/libgtalk_jni.so
        ;;
    *) 
        echo "Usage: $0 {backup|restore}"
        exit 1
esac

exit 0
