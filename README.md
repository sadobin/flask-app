# flask-app

## Dockerized simple flask application

In this project nginx configured as load balancer with round robin method. By removing hash mark in nginx/template, it change to ip_hash method. setup.sh file used for automating nginx configuration, building containers, and running containers.

In order to reset app.conf (application nginx configuration) issue follow command:
```
$ bash setup.sh reset
```

Run containers by following command:
```
$ bash setup.sh <instances>
```
that in above, "instances" is number of backend applications which are desired to run.

In order to view containers ip address, use:
```
$ docker inspect -f "{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}" <container-name>
```
