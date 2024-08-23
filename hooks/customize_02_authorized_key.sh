# AUTHORIZED_KEY=  defined in .env
# USER_NAME= defined in .env

cat << EOF > "$1/home/$USER_NAME/.ssh/authorized_keys
$AUTHORIZED_KEY

EOF
chmod u+rw,o-rwx "$1/home/$USER_NAME/.ssh/authorized_keys
