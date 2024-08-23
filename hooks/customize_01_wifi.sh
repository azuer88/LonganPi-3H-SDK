cat << EOF > "$1/etc/NetworkManager/system-connections/AzuerTEK_DSL.nmconnection
[connection]
id=AzuerTEK_DSL
uuid=eb2dc013-34bb-4708-9cd8-bc923925f301
type=wifi
interface-name=wlxe8519ee8f1a0

[wifi]
mode=infrastructure
ssid=AzuerTEK_DSL

[wifi-security]
auth-alg=open
key-mgmt=wpa-psk
psk=r3VduykLwGAC

[ipv4]
method=auto

[ipv6]
addr-gen-mode=default
method=auto

[proxy]

EOF
