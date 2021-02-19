# gmnisrv Docker

Run [gmnisrv](https://git.sr.ht/~sircmpwn/gmnisrv) in a Docker container.

Features:
- gmnisrv automatically creates certificates for sites at runtime
- based off official `debian:slim` image
- runs as `daemon` user

## Configuration

Update `gmnisrv.ini` to include the FQDN of the hostname to serve gemini:// from. Certificates are automatically created on runtime.

The `localhost` configuration allows for testing sites using loopback, but will generate a unsafe certificate that needs approving in the gemini client.

## Build

Build the image:

```
docker build -t gmnisrv .
```

## Run

Run the image listening on port 1965 and bind mounting a local directory that contains gemini content.

```
docker run -it --rm -p 1925:1925 -v $(pwd):/srv/gemini/localhost gmnisrv
```


