#unbound

Simple Docker container to run [unbound](https://unbound.net).

Configuration is setup to use [Cloudflare DNS](https://1.1.1.1) for ipv4 and ipv6.

Build image,

```
docker build -t unbound .
```

Run in background and test on port 853,

```
docker run -d -p 853:53/udp unbound
dig @127.0.0.1 -p 853 duckduckgo.com
```
