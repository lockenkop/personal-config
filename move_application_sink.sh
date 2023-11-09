#!/bin/bash

# Check if an argument was provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <application_name> <source_name>\n"
    echo "source_name:= headset or anlage"
    exit 1
fi

application_name="$1"
case $2 in	
	"headset")
		sink="alsa_output.usb-Corsair_CORSAIR_VIRTUOSO_SE_Wireless_Gaming_Headset_1450372a000700fc-00.analog-stereo"
		;;
	"anlage")
		sink="alsa_output.pci-0000_0c_00.4.analog-stereo"
		;;
esac

# Run pacmd list-sink-inputs and  pipe to awk
# Use awk to find the index associated with the specified application name
sinkindex=$(pacmd list-sink-inputs | awk -v appname="$application_name" '/index:/ {idx=$2} $0 ~ "application.name = \"" appname "\"" {print idx}')
echo $sinkindex

if [ -z "$sinkindex" ]; then
    echo "No index found for application name: $application_name"
else
    for num in $sinkindex
    do
        echo "moving $application_name with index $num to $2"
        pacmd move-sink-input $num $sink
   done
fi
