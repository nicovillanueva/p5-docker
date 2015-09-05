# Processing 3.0b5
Simply downloads the latest P5 package and installs a few required libraries.

P5 by default is run by a script that forks off a Java process. I added a `sed` command to disable this forking, because otherwise the script finishes and the container shuts down.

## How to run
docker run -ti \
    --rm \
    --name p5 \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/sketchbook:/root/sketchbook \
    --device /dev/snd \
    --device /dev/dri \
    nicovillanueva/p5-docker

- Shares the X11 socket and sets the DISPLAY variable to enable the GUI
- Mounts the sketchbook into your home, not to lose work
- Enables sound

## Bugs
As of now, the sketches that change the renderer are not working. For example, if your code sets the size like `size(300, 300, P2D)` or `size(300, 300, P3D)`, it'll break with the error `Failed to find NEWT Display Class`.  
Still working on it, and suspecting of the OpenGL drivers.
