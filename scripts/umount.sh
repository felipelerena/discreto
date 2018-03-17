PROFILE_NAME=$1
MOUNT_POINT=/home/user/.config

echo ">>>> Mounting $MOUNT_POINT"
umount $MOUNT_POINT
echo ">>>> luks closing image"
cryptsetup luksClose $PROFILE_NAME
