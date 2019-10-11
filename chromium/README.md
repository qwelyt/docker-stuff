# Chromium
A container running chromium based on Archlinux.  
Support for hooking into the hosts pulseaudio server.  
chromium-widevine plugin installed, so you can watch Netflix or listen to spotify.

## Build
`docker build -t chromium .`

## Run
Use the `chromium` executable. It mounts everything as needed.  
I would recomend putting this in `~/bin/` and adding your `~/bin` to $PATH.

## Pulsaudio
This container uses the info found in https://github.com/TheBiggerGuy/docker-pulseaudio-example to hook into the hosts pulseaudio server. I can gladly say that this works great!

