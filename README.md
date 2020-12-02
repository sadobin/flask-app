# flask-app

## simple application which is used for dockerize application and nginx.

#### In this little project nginx configured as load balancer with ip_hash method. By removing ip_hash in nginx.conf, it simply turns back to default method, round robin. 

At first enter following command to build containers:
```
$ docker-compose build
```

Run containers by performing following commands:
```
$ docker run -it -d --rm --name flask_app1 --ip 172.17.0.2 flask_flaskapp
$ docker run -it -d --rm --name flask_app2 --ip 172.17.0.3 flask_flaskapp
$ docker run -it -d --rm --name nginx nginx
```

In order to view nginx container ip address, use:
```
$ docker inspect -f "{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}" nginx
```
