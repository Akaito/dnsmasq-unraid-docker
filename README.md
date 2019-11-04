dnsmasq-unraid-docker
=====================

No-rebuild configurable Docker container for dnsmasq, meant for use on Unraid.

To use in Unraid, be sure to:
1. Add port mappings for 53 TCP and UDP.
2. Set ADDITIONAL_PARAMS as desired.
   Each `--server=8.8.8.8` is a DNS server to use.
   Each `--address=/example.com/192.168.0.42` is a manual host -> IP to always use.
3. Be sure to use a bridge network and give this container its own IP address.
   So it's not in conflict with any other containers/services claiming port 53
   on your host machine.


Explanation
-----------

To connect to a self-hosted server in Minecraft on Nintendo Switch, you need to
make one of its featured server domains resolve to your server's IPv4 address.
Then trying to join that featured server instead joins your self-hosted server.

For the Nintendo Switch to make use of this container, be sure to set its first
DNS server to this container's IP address.  If you're forwarding port 53 from
outside your router, you'll be able to access your server from anywhere.  So
long as you know your router's public IP at all times (search "dynamic DNS" for
solutions to this).

Bonus: if you're also running a Pi-hole, you can set it as a `--server=x.x.x.x`
to get ad-blocking on the go, too.

