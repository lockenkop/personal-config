### Personal Config

### TODO


- [ ] add code extensions
- [ ] add keyboard shortcuts
- [ ] set default browser
- [ ] maybe force yay install with correct package names
- [ ] yay install skip if installed
- [ ] run mhwd graphics driver installation
- [ ] maybe start rofi before generating link to config or create the folder ln: failed to create symbolic link '/home/jonas/.local/share/rofi/themes/squared-material-red.rasi': No such file or directory


### creating a new link

copy the existing config
```bash
cp ~/.config/foldername foldername
```

add it to gen_links.sh
```bash
mkln "foldername"                       "$HOME/.config/foldername"
```

## PulseAudio
#### move_app_sink.sh

This script accepts one or two arguments:
- $1 being the ouptput (0 headphones, 1 stereo)
- $2 application name (Firefox, Teamspeak), optional

all streams will get moved to $1.<br>
if $2, only streams matching their application.name to $2 will get moved to $1

# KDE
## kwinrc
stores kwin (KDE compositor) configuration
This includes the tiling configuration for each monitor.
The monitors are indexed by some ID This could/will change per system/install
```ini
[Tiling][9a2c812a-09ef-5827-b5c5-e7249360d0c3]
tiles={"layoutDirection":"horizontal","tiles":[{"width":0.25},{"width":0.5},{"width":0.25}]}

[Tiling][c96ba2d0-ddc6-5db9-af6c-dce988de970a]
tiles={"layoutDirection":"floating","tiles":[{"height":0.5851851851851753,"width":0.5531249999999894,"x":0.08385416666666635,"y":0.34212962962963134},{"height":0.9972222222222108,"width":0.9999999999999691,"x":0,"y":0}]}
```

The first config is my main monitor with 32:9 aspect ration being tiled as 

| 8:9       | 16:9      | 8:9           |
|:-----------:|:-----------:|:-----------:|
| 1380x1440 | 2560x1440 | 1380x1440 |


influenced and partly straight up copied from here: https://github.com/funnyboy-roks/personal-config
