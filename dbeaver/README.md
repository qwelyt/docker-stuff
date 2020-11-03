# Dbeaver
https://dbeaver.io/  
Universal db-tool in a container.

## start.sh
I got trouble with dbeaver not actually being able to start due to some gtk-problems.  
This got amplified by dbeaver not using a non-zero exit code when the error occured. So from bashs perspective the application ran and exited just fine. In reality, it failed and we never got to use the application.  
The solution to this is script. Script your way out of trouble. But since we can't use the exit code to determine if we actually ran the application we have to resort to some ugly hacks with log files and grep. The script says it all for how this is done.  
This works. And is ugly.

### Telling dbeaver about the problem
I opened a ticket over at dbeaver with a feature-request that they use a non-zero exit code when this happens.  
You can follow it here if you care: https://github.com/dbeaver/dbeaver/issues/10231
