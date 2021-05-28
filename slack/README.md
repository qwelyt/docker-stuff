# How the F do I login?
Slack has a real stupid sign in process. It requires you to have a web browser installed.  
This container has no web browser (apart from the electron app that slack is). So to sign  
in you have to do some stupid steps. 

    1) Start the container
    2) Right click the "Sign in" and copy the link
    3) Paste link into some browser
    4) Select the workspace you want to sign into
    5) Wait for the redirect to fail. Do *NOT* let it sign in to the web version
    6) You should get a "Copy blablabla to clipboard" button that asks you to paste something into the app
    7) Go back to the app. It should now sign you in.

And that seems to work.
