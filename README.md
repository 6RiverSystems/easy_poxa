# easy_poxa
A simple way to deploy [Poxa](https://github.com/edgurgel/poxa) on Docker

## How to run
To run the Poxa Docker container using the slamper/easy_poxa image use:
```
docker run -e PORT=<YOUR_PORT> -e POXA_APP_ID=<YOUR_APP_ID> -e POXA_SECRET=<YOUR_SECRET> -e POXA_APP_KEY=<YOUR_APP_KEY> -d --name poxa -p 8080:<YOUR_PORT> slamper/easy_poxa
```
## Multi-app deployments
See the multi-apps branch
