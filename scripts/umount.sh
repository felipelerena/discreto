PROFILE_NAME=$1
MOUNT_POINT=/media/$PROFILE_NAME

echo ">>>> Mounting $MOUNT_POINT"
umount $MOUNT_POINT
echo ">>>> luks closing image"
cryptsetup luksClose $PROFILE_NAME
