if [ -n "$NTP_SERVER" ]; then
    sed -i.bak -e "/\[Time\]/a NTP=$NTP_SERVER" "$1/etc/systemd/timesyncd.conf"
else
    echo "NTP_SERVER not set, will not do anything."
fi