#!/bin/bash

program_name=$1

if command -v $program_name &> /dev/null ; then
    echo "$program_name is installed."
else
    echo "$program_name is not installed."
fi