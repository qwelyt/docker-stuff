# docker-stuff
Docker images and how to run them

## What?
Just containers I build and use. I like the idea of using Docker for everything, and like "everyone else" I was impressed by Jess Frazelle (https://github.com/jessfraz). Running everything in a container? Why not?  
So that is what I'm trying to do and learn, but with my own Dockerfiles so I actually learn what the heck it's all about.

## docker-on-x
I use `docker-on-x` to run GUI stuff. It's a simpel script that helps with running containers with a GUI. Read more over at: https://paddy-hack.gitlab.io/posts/running-dockerized-gui-applications/  
The actual script can be found over at https://gitlab.com/dotter/docker/blob/master/bin/docker-on-x  
`wget https://gitlab.com/dotter/docker/raw/master/bin/docker-on-x`

## Get them from dockerhub
If you don't want to build the image yourself you can get them over at https://hub.docker.com/r/qwelyt/apps/tags  
I have setup github actions to build them for me and publish them over at dockerhub.  
The format for getting an image is `qwelyt/apps:THE_APPLICATION[-gitsha]`, so for example `qwelyt/apps:firefox` will get you the latest firefox image I've built. Each build also publishes with a `-gitsha` postfix, just so one can go back and use an older version. Not entierly fool proof though as I could build from the same commit several times, and by that override what's over at dockerhub. Should probably get the date into that format as well.

### You still need to get the docker-on-x script
Yeah, you will need that one just the same. And you might want to get my run scripts from here as well. Unless you write your own. But at least you maybe don't have to spend time building them, just `docker pull qwelyt/apps:GIMP
