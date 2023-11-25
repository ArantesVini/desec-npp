packet = """
"""

bytes_list = packet.split()

source_mac = (
    bytes_list[0]
    + ":"
    + bytes_list[1]
    + ":"
    + bytes_list[2]
    + ":"
    + bytes_list[3]
    + ":"
    + bytes_list[4]
    + ":"
    + bytes_list[5]
)
destination_mac = (
    bytes_list[6]
    + ":"
    + bytes_list[7]
    + ":"
    + bytes_list[8]
    + ":"
    + bytes_list[9]
    + ":"
    + bytes_list[10]
    + ":"
    + bytes_list[11]
)

source_ip = (
    str(int(bytes_list[26], 16))
    + "."
    + str(int(bytes_list[27], 16))
    + "."
    + str(int(bytes_list[28], 16))
    + "."
    + str(int(bytes_list[29], 16))
)
destination_ip = (
    str(int(bytes_list[30], 16))
    + "."
    + str(int(bytes_list[31], 16))
    + "."
    + str(int(bytes_list[32], 16))
    + "."
    + str(int(bytes_list[33], 16))
)

print("Source MAC:", source_mac)
print("Destination MAC:", destination_mac)
print("Source IP:", source_ip)
print("Destination IP:", destination_ip)

protocol = int(bytes_list[23], 16)

protocol_names = {1: "ICMP", 6: "TCP", 17: "UDP"}

protocol_name = protocol_names.get(protocol, "Unknown")

print("Protocol:", protocol_name)

if protocol_name == "TCP":
    print("TCP Header")
    print("Source Port:", int(bytes_list[34] + bytes_list[35], 16))
    print("Destination Port:", int(bytes_list[36] + bytes_list[37], 16))
    print(
        "Sequence Number:",
        int(bytes_list[38] + bytes_list[39] + bytes_list[40] + bytes_list[41], 16),
    )
    print(
        "Acknowledgement Number:",
        int(bytes_list[42] + bytes_list[43] + bytes_list[44] + bytes_list[45], 16),
    )
    print("Header Length:", int(bytes_list[46][0], 16) * 4)
    print("Flags:", int(bytes_list[47], 16))
    active_tcp_flags = []
    if int(bytes_list[47], 16) & 1:
        active_tcp_flags.append("FIN")
    if int(bytes_list[47], 16) & 2:
        active_tcp_flags.append("SYN")
    if int(bytes_list[47], 16) & 4:
        active_tcp_flags.append("RST")
    if int(bytes_list[47], 16) & 8:
        active_tcp_flags.append("PSH")
    if int(bytes_list[47], 16) & 16:
        active_tcp_flags.append("ACK")
    if int(bytes_list[47], 16) & 32:
        active_tcp_flags.append("URG")
    print("Active Flags:", active_tcp_flags)
    print("Window Size:", int(bytes_list[48] + bytes_list[49], 16))
    print("Checksum:", int(bytes_list[50] + bytes_list[51], 16))
    print("Urgent Pointer:", int(bytes_list[52] + bytes_list[53], 16))
    print("Options:", bytes_list[54 : 54 + (int(bytes_list[46][0], 16) * 4) - 20])

ascii_data = ""
for byte in bytes_list[54 + (int(bytes_list[46][0], 16) * 4) - 20 :]:
    ascii_data += chr(int(byte, 16))
print("ASCII Data:", ascii_data)
req = ascii_data.split("\r\n")
print(req)