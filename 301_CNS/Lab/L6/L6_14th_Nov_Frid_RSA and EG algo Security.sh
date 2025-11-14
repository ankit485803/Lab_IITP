

:'

14th Nov 2025 (Friday - Syllabus CNS completed and EndSem5 happend on 3rd Dec 2025)


Lab is based on the Computer Security parts and two algo: RSA and EG 


RSA - Short Notes (TXT Format)

RSA is an asymmetric (public-key) encryption algorithm based on the difficulty of factoring large prime numbers.

Key Generation:

Choose two large primes p and q.

Compute n = p * q.

Compute phi(n) = (p - 1)(q - 1).

Choose public exponent e such that gcd(e, phi(n)) = 1.

Compute private exponent d such that d = e^(-1) mod phi(n).

Public Key: (e, n)
Private Key: (d, n)

Encryption:
C = M^e mod n

Decryption:
M = C^d mod n


Notes:
        Security is based on difficulty of factoring n.
        Used for secure communication, key exchange, digital signatures.
        Slow for large data, usually encrypts only small messages or keys.





'