# Discord
A container running discord based on Archlinux.  
Support for hooking into the hosts pulseaudio server.  
discord-widevine plugin installed, so you can watch Netflix or listen to spotify.

## Build
`docker build -t discord .`

## Seccomp
Be sure to add the `chrome.json` seccomp file to your docker-seccomp folder.  
This is probably located at something like `/etc/docker/seccomp/`.

## Run
Use the `discord` executable. It mounts everything as needed.  
I would recomend putting this in `~/bin/` and adding your `~/bin` to $PATH.

## Pulsaudio
This container uses the info found in https://github.com/TheBiggerGuy/docker-pulseaudio-example to hook into the hosts pulseaudio server. I can gladly say that this works great!

