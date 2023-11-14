#!/bin/bash

xrandr --verbose --output DP-0 --mode 3840x2160 --rate 60.0
xrandr --verbose --output DP-2 --primary --mode 5120x1440 --rate 120.0
xrandr --verbose --output DP-2 --primary --below DP-0
kscreen-doctor output.477.primary
