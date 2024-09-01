#!/usr/bin/env bash

# load .env
set -a && source .env && set +a

set -x

BUILDPATH="$(realpath -s './build')"

if [ -f "${BUILDPATH}/rootfs_base.tar" ]; then 
    echo "Using 'rootfs_base.tar as base image, will overwrite rootfs.tar"
    read -n1 -s -r -p $'Press space to continue...\n' key

    if [ "$key" = ' ' ]; then
        # Space pressed, do something
        # echo [$key] is empty when SPACE is pressed # uncomment to trace
        :  # continue
    else
        # Anything else pressed, do whatever else.
        # echo [$key] not empty
        echo "Exiting."
        exit -1
    fi
fi 


ARCHIVEMOUNT=`which archivemount`
if [ ! -x "${ARCHIVEMOUNT}" ] ; then 
    echo "Can not find archivemount executable.  Maybe apt install archivemount?"
fi 

# mount build/rootfs.tar
archivemount "$BUILDPATH/rootfs.tar" "$BUILDPATH/root" 


SCRIPTS="./custom"
PATTERN="*.sh"

# find "$SCRIPTS" -maxdepth 1 -type f ! -name "$PATTERN" -print0 | while read -r -d '' file; do
#   echo "$file"
# done

for file in $SCRIPTS/$PATTERN; do
    if [ -f  "${file}" ] && [ -r "${file}" ] && [ -x "${file}" ] ; then
        echo "Executing $file"
        sudo exec "$file" "$BUILDPATH/root"
    else
        echo "skipped: $file"
    fi
done

# unmount 
fusermount -u ./build/root