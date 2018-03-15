PROFILE_NAME=$1
IMG_FILE=$2

MOUNT_POINT=/media/$PROFILE_NAME

echo ">>>> Creating mount point"
mkdir $MOUNT_POINT
echo ">>>> luks opening image"
cryptsetup luksOpen $IMG_FILE $PROFILE_NAME
echo ">>>> Mounting $MOUNT_POINT"
mount /dev/mapper/$PROFILE_NAME $MOUNT_POINT
chown -R user:user $MOUNT_POINT
ln -s /media/enc /home/user/.mozilla
