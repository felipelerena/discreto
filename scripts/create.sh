PROFILE_NAME=$1
IMG_FILE=$2

if [ ! -f $IMG_FILE ]; then
    echo ">>>> creating empty file $IMG_FILE"
    dd if=/dev/zero of=$IMG_FILE bs=1M count=256
    echo ">>>> luks formating image"
    cryptsetup -y luksFormat $IMG_FILE
    echo ">>>> luks opening image"
    cryptsetup luksOpen $IMG_FILE $PROFILE_NAME
    echo ">>>> ext4 formating luks image"
    mkfs.ext4 /dev/mapper/$PROFILE_NAME
fi
