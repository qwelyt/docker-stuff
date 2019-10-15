# IntelliJ
A container running IntelliJ based on ArchLinux.  
This comes in two flavors: OpenJDK or OracleJDK.  
Both are Java8 as that is what I'm currently working in. There should be little trouble moving to a more recent version of java if that is what you need.

## Build
`cd <flavor> && docker build -t intellij .`

## Run
Run the `intellij` executable. It mounts things needed to have a persistent work flow.  
I would recomend putting this in `~/bin/` and adding your `~/bin` to $PATH.

## Folders
`intellijSettings/intellij` is where things that is relevant for the editor it self is stored. It contains your current workspace, run profiles,  etc etc. Important stuff.  
`intellijSettings/java` has settings contains various information about fonts on your system as well as your licens information.  
`code` is where you should host your code.  
`.m2` Just mount in your local maven folder. I do stuff outside IntelliJ as well as inside it and I just don't want to keep maven packages in several places.
