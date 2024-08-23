# AUTHORIZED_KEY=  defined in .env
# USER_NAME= defined in .env

cat << EOF > "$1/home/$USER_NAME/.ssh/authorized_keys"
$AUTHORIZED_KEY

EOF
chmod 0600 "$1/home/$USER_NAME/.ssh/authorized_keys"
