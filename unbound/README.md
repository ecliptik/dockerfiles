# unbound

Simple Docker container to run [unbound](https://unbound.net).

Configuration is setup to use [Cloudflare DNS](https://1.1.1.1) for ipv4 and/or ipv6.

Build image,

IPV4

```
docker build -t unbound .
```

IPV6

```
docker build -f Dockerfile.ipv6 unbound .
```

Run in background and test on port 853,

```
docker run -d -p 853:53/udp unbound
dig @127.0.0.1 -p 853 duckduckgo.com
```

## Setting up ipv6 in Docker
In order to use the Cloudfare ipv6 addresss, Docker must be setup properly to use ipv6.

First find the ipv6 range of your router (ip addr on the host machine), for example based on the following address, the ip range is `2100:1800:6390::/64`.

```
$ ip -6 addr show dev eth0
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 state UP qlen 1000
    inet6 2100:1800:6390:845f:b954:d676:8651:bc11/64 scope global mngtmpaddr noprefixroute dynamic
       valid_lft 2591957sec preferred_lft 604757sec
    inet6 fd92:728a:120d:1:73d2:3a4d:c218:c02c/64 scope global mngtmpaddr noprefixroute dynamic
       valid_lft 2591957sec preferred_lft 604757sec
    inet6 fe82::f8f1:149:2b4c:fe35/64 scope link
       valid_lft forever preferred_lft forever
```

Use this range in `/etc/docker/daemon/json` when [enabling ipv6 in Docker](https://docs.docker.com/v17.09/engine/userguide/networking/default_network/ipv6/#how-ipv6-works-on-docker),

```
{
  "ipv6": true,
  "fixed-cidr-v6": "2100:1800:6390::/64"
}
```

Restart Docker and verify the `docker0` interface is using an ipv6 address in this range,

```
4: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 state DOWN
    inet6 2100:1800:6390::1/64 scope global tentative
       valid_lft forever preferred_lft forever
    inet6 fe80::1/64 scope link tentative
       valid_lft forever preferred_lft forever
```

Configure `docker-compose.yml` to use this range. Update the `ipv6_address`, `subnet`, and `gateway` to match the ipv6 range.

Add the following to `/etc/sysctl.conf` to allow containers to use the ipv6 stack properly.

```
net.ipv6.conf.eth0.proxy_ndp=1
net.ipv6.conf.eth0.accept_ra=2
```

Allow traffic from the `ipv6_address` in `docker-compose.yml` to reach the internet (if not done ipv6 will be configure but unable to go outside the container)

```
sudo ip -6 neigh add proxy 2100:1800:6390:845f::10 dev eth0
```

Test by bringing up the unbound stack with `docker-compose up`, exec into the container and try a `ping6 ipv6.google.com` to verify it's working.
