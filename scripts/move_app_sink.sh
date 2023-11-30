#!/bin/bash

# The first argument is a sink ID
sink_id=$1

# Check if a second argument is provided
if [ -n "$2" ]; then
    # Search for the string in pactl list sink-inputs and match it to application.name
    input_id=$(pactl list sink-inputs | grep -B 20 -i "$2" | awk '/Sink Input #/{print $3}')
    echo $input_id
    if [ -z "$input_id" ]; then
        echo "No matching sink-input found for '$2'. Exiting."
        exit 1
    fi
fi

# Change the default sink to the new sink
pactl set-default-sink "$sink_id"

# if there is a second argument only move the application with that name
if [ -n "$2" ]; then
    for stream in $(pactl list short sink-inputs | awk -v input="$input_id" '{if ($2 == input) print $1}'); do
        app_name=$(pactl list sink-inputs | awk -v stream_id="$stream" '$1 == "Application" && $2 == stream_id {getline; print}')
        if [[ $app_name == $2 ]]; then
            pactl move-sink-input "$stream" "$input_id"
        fi
    done
fi
# Move all running streams to the new sink
for stream in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$stream" "$sink_id"
done
