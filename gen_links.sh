#!/bin/bash
# Create the links for all the config files to this directory
# _Note: This will rename any previous dir to "${DIR}_OLD"_

function mkln() {
  from="$1"
  to="$2"

  if ! [ -L "$to" ]; then # Move if it is not a link
    mv "$to" "${to}_OLD" >/dev/null 2>/dev/null && echo "Moved $to to ${to}_OLD"
  else # Otherwise, yeet it
    target="$(readlink -f "$to")"
    rm "$to" &>/dev/null && echo "Removed previous link ${to/$HOME/~} -> ${target/$HOME/~}"
  fi
  ln -s "$(pwd)/$from" "$to"
}

if [[ $(whoami) == "jonas" ]]; then
  mkln "zsh/.zshrc" "$HOME/.zshrc"
  mkln "zsh/.p10k.zsh" "$HOME/.p10k.zsh"
  mkln "alacritty" "$HOME/.config/alacritty"
  mkln "fastfetch" "$HOME/.config/fastfetch"
  # mkln ".vimrc"                                       "$HOME/.vimrc"
  mkln "nvim-config" "$HOME/.config/nvim"
  # mkln "autostart"                                    "$HOME/.config/autostart"
  mkln "scripts" "$HOME/scripts"
  mkln "IoTuring" "$HOME/.config/IoTuring"
  # mkln "Code/User"                                    "$HOME/.config/Code/User"
  # mkln "gtk-3.0"                                      "$HOME/.config/gtk-3.0"
  # mkln "gtk-4.0"                                      "$HOME/.config/gtk-4.0"
  # mkln "kwinrc"                                       "$HOME/.config/kwinrc"
  # mkln "rofi"                                         "$HOME/.config/rofi"
  # mkln "rofi/squared-material-red.rasi"               "$HOME/.local/share/rofi/themes/squared-material-red.rasi"
  # mkln "wofi"                                         "$HOME/.config/wofi"
  # mkln "plasma-org.kde.plasma.desktop-appletsrc"      "$HOME/.config/plasma-org.kde.plasma.desktop-appletsrc"
  # mkln "i3/config"                                    "$HOME/.i3/config"
  mkln "waybar" "$HOME/.config/waybar"
  mkln "scroll" "$HOME/.config/scroll"
  mkln "sway" "$HOME/.config/sway"
  # mkln "polybar/config.ini"                           "$HOME/.config/polybar/config.ini"
  # mkln "polybar/launch.sh"                            "$HOME/.config/polybar/launch.sh"
  # mkln "awesome/rc.lua"                               "$HOME/.config/awesome/rc.lua"
  # mkln "awesome/themes"                               "$HOME/.config/awesome/themes"
fi

if [[ $(whoami) == "root" ]]; then
  # mkln "scripts/display/nvidia/fernseher.sh"          "/usr/bin/fernseher"
  # mkln "scripts/display/nvidia/standard.sh"           "/usr/bin/standard"
  # mkln "fancontrol"                                   "/etc/fancontrol"
  # mkln "autostart/fancontrol.service"                 "/usr/lib/systemd/system/fancontrol.service"
  # mkln "scripts/move_app_sink.sh"                     "/usr/bin/move_app_sink"
  # mkln "theme/border-only"                            "/usr/share/themes/border-only"
  #mkln ".xinitrc"                                      "/etc/X11/xinit/xinitrc"
fi
