#!/system/xbin/awk -f
# this script simply acknowledges any AT command
# received and confirms the CONNECT after an ATD
# command is processed.

BEGIN { RS="\r" }

function send(cmd) {
    print "<- " cmd "\n" > "/dev/stderr";
    printf cmd "\r\n";
}

{
    print "-> "$0 > "/dev/stderr"
}

$1~/^ATD/ {
    send("CONNECT");
    exit 0;
}

$1~/^AT/ {
    send("OK");
}

