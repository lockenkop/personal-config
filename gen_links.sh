#!/bin/bash
# Create the links for all the config files to this directory
# _Note: This will rename any previous dir to "${DIR}_OLD"_

function mkln () {
    from="$1"
    to="$2"

    if ! [ -L "$to" ]; then # Move if it is not a link
        mv "$to" "$to_OLD" > /dev/null 2> /dev/null && echo "Moved $to to $to_OLD"
    else # Otherwise, yeet it
        target="$(readlink -f "$to")"
        rm "$to" &> /dev/null && echo "Removed previous link ${to/$HOME/~} -> ${target/$HOME/~}"
    fi
    ln -s "$(pwd)/$from" "$to"
}

mkln "zsh"                  "$HOME/.zsh"
mkln "zsh/.zshrc"           "$HOME/.zshrc"
mkln ".vimrc"               "$HOME/.vimrc"
mkln "autorandr"            "$HOME/.config/autorandr"
mkln "scripts"              "$HOME/scripts"

