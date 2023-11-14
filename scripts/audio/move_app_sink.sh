#!/bin/bash


app_name=$1
echo $app_name
grep="Sink Input #[0-9]+|application.name = $app_name"
# TODO still outputs all sink-inputs
filtered_lines=$(pactl list sink-inputs | grep -E "Sink Input #[0-9]+|application.name = "$app_name"")
echo $filtered_lines
sink_input_ids=$(echo "$filtered_lines" | awk '/Sink Input/{gsub(/[^0-9]/,"",$3); print $3}')
echo $sink_input_ids

#TODO case for headset
#case $sink 
for id in $sink_input_ids; do
    echo $id
    pactl move-sink-input $1 alsa_output.pci-0000_0d_00.4.analog-stereo
    
done