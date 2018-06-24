#!/bin/bash
mkdir images -p
docker run -ti --rm --net host -e DISPLAY=unix$DISPLAY -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native --cpuset-cpus 0 --memory 512mb --device /dev/snd --device /dev/video0 --device /dev/dri --privileged --group-add $(getent group audio | cut -d: -f3) -v /tmp/.X11-unix:/tmp/.X11-unix -v /run/dbus/:/run/dbus/ -v /dev/shm:/dev/shm -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native -v $(pwd)/images:/home/user/images -v $(pwd)/scripts:/home/user/scripts discreto scripts/run_browser.sh $1 $2
