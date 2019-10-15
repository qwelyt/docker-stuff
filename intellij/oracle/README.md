# OracleJDK based IntelliJ
If you want to use Oracles JDK you will have to download the actual JDK from their website.  

## Download
https://www.oracle.com/technetwork/java/javase/downloads/  
The download requires you to register and agree to som TOS, which is why it's not
included here.  
This is the Internet, so alternative sources are sure to be found. These alternative are howevir in violation to the TOS and will probably be taken down, should Oracle find them.  
Do as you wish with the JDK, but you won't find it here anyway.

## Then what
Put it next to the Dockerfile and name it `jdk-8u221-linux-x64.tar.gz`. Should be the standard name. The file will be copied into the image and installed.


## Redistribute the image
Since the image will now contain a JDK that you should not be redistributing, redistributing the image is most likely not allowed. I'm no layer, but I'm pretty sure that the TOS apply even if you change the packaging.  
On my part I have no problem if you share this with anyone you might want, I don't care. But Oracle might. Read the TOS, ask them etc. GLHF.
