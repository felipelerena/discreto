docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --privileged -v $(pwd)/images:/home/user/images -v $(pwd)/scripts:/home/user/scripts discreto
