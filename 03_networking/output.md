# Networking Commands – Practical Output

**Name:** Gaurav Kumar  
**Roll No:** 10066  
**Date:** 03 September 2026  

---

## 1. `ifconfig` – View Network Interface Details

```
$ ifconfig en0

en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	options=6460<TSO4,TSO6,CHANNEL_IO,PARTIAL_CSUM,ZEROINVERT_CSUM>
	ether 4a:c3:69:ca:2c:cc
	inet6 fe80::140c:4268:e5f7:c659%en0 prefixlen 64 secured scopeid 0xb
	inet 100.128.170.105 netmask 0xfffff000 broadcast 100.128.175.255
	nd6 options=201<PERFORMNUD,DAD>
	media: autoselect
	status: active
```

**What I understood:**  
`ifconfig` shows the network interfaces on the system. `en0` is the Wi-Fi interface on my Mac. I could see my IP address (`100.128.170.105`), my MAC address (`4a:c3:69:ca:2c:cc`), and that the interface is currently `active`. The `inet` field is my IPv4 address and `inet6` is the IPv6 link-local address.

---

## 2. `ping` – Check Connectivity to a Host

```
$ ping -c 4 google.com

PING google.com (142.250.207.174): 56 data bytes
64 bytes from 142.250.207.174: icmp_seq=0 ttl=120 time=39.435 ms
64 bytes from 142.250.207.174: icmp_seq=1 ttl=120 time=15.809 ms
64 bytes from 142.250.207.174: icmp_seq=2 ttl=120 time=15.862 ms
64 bytes from 142.250.207.174: icmp_seq=3 ttl=120 time=16.818 ms

--- google.com ping statistics ---
4 packets transmitted, 4 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 15.809/21.981/39.435/10.085 ms
```

**What I understood:**  
`ping` sends ICMP echo request packets to a target host and waits for a reply. I used `-c 4` to send exactly 4 packets. The result shows 0% packet loss meaning my machine can reach `google.com` successfully. The `time` field tells me the round-trip latency – around 15–39 ms which is normal for a remote server.

---

## 3. `traceroute` – Trace the Path to a Host

```
$ traceroute -m 10 google.com

traceroute to google.com (142.250.207.174), 10 hops max, 40 byte packets
 1  wifi.height8tech.com (100.128.160.1)  21.032 ms  5.643 ms  6.712 ms
 2  114.79.130.29.dvois.com (114.79.130.29)  17.683 ms  45.152 ms  23.131 ms
 3  72.14.208.165 (72.14.208.165)  17.170 ms  18.353 ms  17.934 ms
 4  192.178.84.175 (192.178.84.175)  22.632 ms
    192.178.111.151 (192.178.111.151)  19.224 ms
 5  142.250.214.111 (142.250.214.111)  20.682 ms  19.461 ms
 6  pnbomb-bl-in-f14.1e100.net (142.250.207.174)  17.814 ms  24.110 ms  17.814 ms
```

**What I understood:**  
`traceroute` shows every router (hop) a packet passes through on its way to the destination. Hop 1 is my Wi-Fi router (`100.128.160.1`), hop 2 is my ISP, and the final hop is Google's server. The three time values per hop are three separate probe packets — this helps detect if a specific router is slow or dropping packets.

---

## 4. `nslookup` – DNS Lookup

```
$ nslookup google.com

Server:		100.128.160.1
Address:	100.128.160.1#53

Non-authoritative answer:
Name:	google.com
Address: 142.250.207.174
```

**What I understood:**  
`nslookup` is used to query DNS and find the IP address of a domain name. My DNS server is `100.128.160.1` (my router at port 53). It resolved `google.com` to `142.250.207.174`. This is how browsers find the IP behind a domain before making a connection.

---

## 5. `netstat` – Active Network Connections

```
$ netstat -an | head -30

Active Internet connections (including servers)
Proto Recv-Q Send-Q  Local Address                   Foreign Address          (state)
tcp4       0      0  100.128.170.105.50859  192.178.211.188.5228   ESTABLISHED
tcp4       0      0  100.128.170.105.50856  172.217.118.4.443      ESTABLISHED
tcp4       0      0  100.128.170.105.50842  172.217.115.4.443      ESTABLISHED
tcp4       0      0  100.128.170.105.50821  172.217.113.4.443      ESTABLISHED
tcp4       0      0  100.128.170.105.50741  108.158.61.97.443      ESTABLISHED
tcp6       0      0  *.50461                *.*                    LISTEN
tcp4       0      0  *.50461                *.*                    LISTEN
tcp4       0      0  127.0.0.1.49896        *.*                    LISTEN
tcp4       0      0  127.0.0.1.49895        *.*                    LISTEN
```

**What I understood:**  
`netstat -an` lists all current active network connections and listening ports. `ESTABLISHED` means an active connection is open right now (many going to Google on port 443 = HTTPS). `LISTEN` means the system is waiting for incoming connections on that port. This is useful for checking which services are running or if there are unexpected open connections.

---

## 6. `curl` – Transfer Data from a URL

```
$ curl -I https://google.com

HTTP/2 301
location: https://www.google.com/
content-type: text/html; charset=UTF-8
date: Thu, 03 Sep 2026 14:24:47 GMT
expires: Sat, 03 Oct 2026 14:24:47 GMT
cache-control: public, max-age=2592000
server: gws
content-length: 220
x-xss-protection: 0
x-frame-options: SAMEORIGIN
```

**What I understood:**  
`curl -I` fetches only the HTTP headers of a URL without downloading the full page. The response `HTTP/2 301` means the server is redirecting us from `google.com` to `www.google.com`. I can also see the server type (`gws` = Google Web Server), cache-control, and security headers. `curl` is very useful for testing APIs and checking server responses.


