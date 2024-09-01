# AUTHORIZED_KEY=  defined in .env
# USER_NAME= defined in .env

mkdir -p "$1/home/$USER_NAME/.ssh" 
chmod 0700 "$1/home/$USER_NAME/.ssh"

cat << EOF > "$1/home/$USER_NAME/.ssh/authorized_keys"
$AUTHORIZED_KEY

EOF
chmod 0600 "$1/home/$USER_NAME/.ssh/authorized_keys"
chown 1000:1000 "$1/home/$USER_NAME/.ssh"

