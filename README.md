# easy_poxa
A simple way to deploy [Poxa](https://github.com/edgurgel/poxa) on Docker

## How to run
To run the Poxa Docker container using the slamper/easy_poxa image use:
```
docker run -e POXA_APP_COUNT=<APP_COUNT> -e PORT=<YOUR_PORT> -e POXA_APP_ID_<index>=<YOUR_APP_ID> -e POXA_SECRET_<index>=<YOUR_SECRET> -e POXA_APP_KEY_<index>=<YOUR_APP_KEY> -d --name poxa -p 8080:<YOUR_PORT> slamper/easy_poxa
```
```POXA_APP_COUNT``` indicates how many different apps you want to deploy.

The index shows which app you want to configure ```POXA_APP_ID_<index>=<YOUR_APP_ID>```

You need to add env variables for each app like this:
```
POXA_APP_ID_1=app1id
POXA_APP_ID_2=idofapp2
POXA_APP_KEY_1=app1key
POXA_APP_KEY_2=app2key
POXA_SECRET_1=app1secret
POXA_SECRET_2=app1secret
```

You have to specify every argument for each app or the script will quit printing the error to the console and use the default configuration.
