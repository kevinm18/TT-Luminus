import socket, ipaddress
import subprocess
import xml.etree.ElementTree


def get_default_gateway_linux():
    """Read the default gateway directly from /proc."""
    with open("/proc/net/route") as fh:
        for line in fh:
            fields = line.strip().split()
            if fields[1] != '00000000' or not int(fields[3], 16) & 2:
                continue

            return socket.inet_ntoa(struct.pack("<L", int(fields[2], 16)))

ip = socket.gethostbyname(socket.gethostname())
net = ipaddress.ip_network(ip)
red = net.network_address
mask = net.netmask
gateway = get_default_gateway_linux()