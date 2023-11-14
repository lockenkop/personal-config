#!/bin/bash
# Create the links for all the config files to this directory
# _Note: This will rename any previous dir to "${DIR}_OLD"_

function mkln () {
    from="$1"
    to="$2"

    if ! [ -L "$to" ]; then # Move if it is not a link
        mv "$to" "${to}_OLD" > /dev/null 2> /dev/null && echo "Moved $to to ${to}_OLD"
    else # Otherwise, yeet it
        target="$(readlink -f "$to")"
        rm "$to" &> /dev/null && echo "Removed previous link ${to/$HOME/~} -> ${target/$HOME/~}"
    fi
    ln -s "$(pwd)/$from" "$to"
}

if [[ $(whoami) == "jonas" ]]; then
    mkln "zsh"                                          "$HOME/.zsh"
    mkln "zsh/.zshrc"                                   "$HOME/.zshrc"
    mkln ".vimrc"                                       "$HOME/.vimrc"
    mkln "autorandr"                                    "$HOME/.config/autorandr"
    mkln "autostart"                                    "$HOME/.config/autostart"
    mkln "scripts"                                      "$HOME/scripts"
    mkln "IoTuring"                                     "$HOME/.config/IoTuring"
    mkln "Code/User"                                    "$HOME/.config/Code - OSS/User" #you don't have to escape spaces, since it's passed as a string (still -.- spaces!!!)
    mkln "gtk-3.0"                                      "$HOME/.config/gtk-3.0"
    mkln "kwinrc"                                       "$HOME/.config/kwinrc"
    mkln "rofi"                                         "$HOME/.config/rofi"
    mkln "rofi/squared-material-red.rasi"               "$HOME/.local/share/rofi/themes/squared-material-red.rasi"
    mkln "plasma-org.kde.plasma.desktop-appletsrc"      "$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc"
fi



if [[ $(whoami) == "root" ]]; then
    mkln "scripts/display/nvidia/fernseher.sh"          "/usr/bin/fernseher"
    mkln "scripts/display/nvidia/standard.sh"           "/usr/bin/standard"
    mkln "fancontrol"                                   "/etc/fancontrol"
fi