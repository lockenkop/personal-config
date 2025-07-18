### Personal Config


### creating a new link

Copy the existing configuration
```bash
cp ~/.config/foldername foldername
```

Add it to gen_links.sh
```bash
mkln "foldername"                       "$HOME/.config/foldername"
```

## PulseAudio
#### move_app_sink.sh

This script accepts one or two arguments:
- $1 being the output (0 headphones, 1 stereo)
- $2 application name (Firefox, Teamspeak), optional

all streams will get moved to $1.<br>
if $2, only streams matching their application.name to $2 will get moved to $1

influenced and partly straight up copied from here: https://github.com/funnyboy-roks/personal-config
