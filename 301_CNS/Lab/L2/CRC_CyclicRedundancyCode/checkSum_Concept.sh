



:' Cyclic Redundancy Check

CRC is a more powerful error detection technique than the basic checksums used by TCP and UDP.
 It is commonly used at lower layers of the network stack, such as the Ethernet (data link layer) frame, to detect errors in the
  physical transmission of data.

CRC is a strong error detection method, better than simple checksums. 
Its used at lower levels of networking, like in Ethernet frames, to find mistakes that happen when data is physically sent. 
TCP and UDP donot use CRC directly, but the networks they run on often do.





Q. diff b/w TCP (Transmission Control Protocol)- two hand sacking and UDP (User Datagram Protocol) which is connectionless 


checkSum = UDP header + UDP data + pseudo header of IP







🎯 Objective of CRC in Socket Programming (as per your lab):
To simulate sending data from server to client over a noisy channel, using socket programming, 
with CRC-based checksum to detect transmission errors.


'