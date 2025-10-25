

# create an annotated tag (no spaces in the tag name)
git tag -a v1.3-MitM-Nmap-TraceRoute-Wireshark -m "MitM attack - Nmap - TraceRoute - Wireshark
Start the computer security lab session from today's lab"

# push the tag to GitHub
git push origin v1.3-MitM-Nmap-TraceRoute-Wireshark




:'

24th Oct 2025 (Friday - After Diwali and before Chhath Puja: ISRO ICRB paper at Lucknow) Lab4


RC4/DES/AES/LFSR - send encrypted data through S between C1 and C2...server will not able to read the actual message and canot tamper it

Key EXchange = Diffie Hellman, so that C1 and C2 agree with a common encryption key by exchanging mathematical computations withoput revealing the secret to th server
MITM can be prevented using any encryption
S is man in the middle...if data is unencrypted it can modify before sending to C2
C1 and C2 is sending data through S
Clients - C1 and C2, Server -S



MITM - Man in the middle attack
wireshark - capture and analyze packets flowing through the network
Nmap - gives the network details of a given ip
Traceroute - to check route to a given IP address





Objectives:

        Implement encrypted communication between two clients (C1, C2) using symmetric encryption so server S cannot read or tamper with payload.
        Use Diffie–Hellman (DH) for key exchange so C1 and C2 derive a shared secret without sending it directly.
        Demonstrate that an unencrypted channel can be tampered with by S (MITM) and show packet captures.
        Learn and use network tools: Wireshark, nmap, traceroute.
        Discuss real mitigation for MITM (why plain DH is vulnerable to active MITM and how to fix it).



Background & theory (short):
    MITM (Man-In-The-Middle): adversary intercepts, reads, modifies messages between two parties. If data is unencrypted, server S can modify easily.
    Diffie–Hellman (DH): allows two parties to compute a shared symmetric key using exponentiation modulo a prime. Important: DH without authentication is vulnerable to an active MITM who can perform a separate DH with each party.
    Symmetric ciphers: RC4 and DES are obsolete/insecure (DES: short key, RC4: biases). Prefer AES (e.g., AES-GCM) for confidentiality + integrity. LFSR is a stream-generator concept (educational), but not secure by itself.
    Authentication / Integrity: use HMAC or AEAD (AES-GCM) or digital signatures/certificates to prevent tampering and MITM. DH + digital signature or DH authenticated via PKI prevents MITM.








'