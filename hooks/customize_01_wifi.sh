# SSID=  load from .env (in mkrootfs.sh)
# PKEY=  load from .env 

echo "ORIG MACID: $MCID"
macid=${MACID//:}
echo "MACID: [$mcid]"
echo "macid: ${macid,,}"

cat << EOF > "$1/etc/NetworkManager/system-connections/$SSID.nmconnection"
[connection]
id=$SSID
uuid=$(uuidgen)
type=wifi
interface-name=wlx${macid,,}

[wifi]
mode=infrastructure
ssid=$SSID

[wifi-security]
auth-alg=open
key-mgmt=wpa-psk
psk=$PKEY

[ipv4]
method=auto

[ipv6]
addr-gen-mode=default
method=auto

[proxy]

EOF
