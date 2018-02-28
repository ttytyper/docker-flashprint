#!/bin/sh
CONFIG_DIR="$HOME/.FlashPrint"
MODEL_DIR="$HOME/3dmodels"

xhost +
docker run --rm --name flashprint --network=none \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v "$CONFIG_DIR:/home/flashprint/.FlashPrint" \
	-v "$MODEL_DIR:/home/flashprint/3dmodels" \
	--privileged \
	-v /dev/bus/usb:/dev/bus/usb \
	-v /dev/dri:/dev/dri:rw \
	-e DISPLAY=unix$DISPLAY \
	"${@}" \
	ttytyper/flashprint &

(sleep 5; xhost -) &
