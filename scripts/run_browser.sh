PROFILE_NAME=enc
IMG_FILE=/home/user/images/$PROFILE_NAME.img

sudo scripts/create.sh $PROFILE_NAME $IMG_FILE
sudo scripts/mount.sh $PROFILE_NAME $IMG_FILE
firefox && \
sudo scripts/umount.sh $PROFILE_NAME
