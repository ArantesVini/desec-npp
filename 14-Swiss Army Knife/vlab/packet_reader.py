packet = """
45 00 00 4c d1 b4 00 00 40 01 4e a3 ac 10 01 37 
ac 10 01 02 08 00 dc 3a 83 08 00 00 64 73 74 20
68 74 74 70 20 70 6f 72 74 20 38 30 20 2f 6d 61
6c 77 61 72 65 2e 74 78 74 20 2d 20 4b 45 59 3a
20 30 30 32 39 38 34 31 37 31 37 32
"""


def discover_packet_protocol(packet):
    bytes_list = packet.split()
    protocol = int(bytes_list[23], 16)
    protocol_names = {
        1: "ICMP",
        6: "TCP",
        17: "UDP",
        41: "IPv6",
        89: "OSPF",
        58: "ICMPv6",
    }
    protocol_name = protocol_names.get(protocol, "Unknown")
    return protocol_name
