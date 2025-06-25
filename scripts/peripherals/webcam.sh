#!/bin/bash

sudo modprobe v4l2loopback devices=1 video_nr=10 card_label="Canon 700D" exclusive_caps=1
gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0

