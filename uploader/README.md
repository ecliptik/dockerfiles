Simple apache/php uploader with self-signed certs.

## Build Image

```
docker build -t uploader .
```

## Generate Self Signed Certs

```
mkdir certs
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout certs/web.key -out certs/web.crt
```

## Create htpasswd

```
htpasswd -c htpasswd username
```

## Run Container

```
docker run -d --name uploader -v `pwd`/certs:/certs -v `pwd`/html:/var/www/html --publish 443:443 uploader
```
