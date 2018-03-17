#!/bin/bash
BROWSER=$1
PROFILE_NAME=$2

IMG_FILE=/home/user/images/$PROFILE_NAME.img
MOUNT_POINT=/home/user/.config

create(){
    PROFILE_NAME=$1
    IMG_FILE=$2

    if [ ! -f $IMG_FILE ]; then
        #echo ">>>> creating empty file $IMG_FILE"
        sudo dd if=/dev/zero of=$IMG_FILE bs=1M count=256
        #echo ">>>> luks formating image"
        sudo cryptsetup -y luksFormat $IMG_FILE
        luks_open
        #echo ">>>> ext4 formating luks image"
        sudo mkfs.ext4 /dev/mapper/$PROFILE_NAME
    fi
}

mount_device(){
    PROFILE_NAME=$1
    IMG_FILE=$2
    MOUNT_POINT=$3

    DEVICE=/dev/mapper/$PROFILE_NAME

    #echo ">>>> Creating mount point"
    mkdir $MOUNT_POINT -p
    luks_open

    #echo ">>>> Mounting $MOUNT_POINT"
    sudo mount $DEVICE $MOUNT_POINT
    sudo chown -R user:user $MOUNT_POINT

    # patching firefox mountpoint
    ln -s /home/user/.config ~/.mozilla
}

umount_device(){
    sudo umount $1
    sudo cryptsetup luksClose $2
}

luks_open(){
    #echo ">>>> luks opening image"
    sudo cryptsetup luksOpen $IMG_FILE $PROFILE_NAME
}

umount_device $MOUNT_POINT $PROFILE_NAME
create $PROFILE_NAME $IMG_FILE
mount_device $PROFILE_NAME $IMG_FILE $MOUNT_POINT
run_browser
$($BROWSER) && \
umount_device $MOUNT_POINT $PROFILE_NAME
