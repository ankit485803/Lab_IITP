

:'

14th Nov 2025 (Friday - Syllabus CNS completed and EndSem5 happend on 3rd Dec 2025)


Lab is based on the Computer Security parts and two algo: RSA and EG 


## RSA - Short Notes (TXT Format)
RSA is an asymmetric (public-key) encryption algorithm based on the difficulty of factoring large prime numbers.

RSA full form: Rivest–Shamir–Adleman
Named after its inventors:
    Ron Rivest
    Adi Shamir
    Leonard Adleman


Key Generation:
    (i)  Choose two large primes p and q.
    (ii) Compute n = p * q.
    (iii)    Compute phi(n) = (p - 1)(q - 1).
    (iv)    Choose public exponent e such that gcd(e, phi(n)) = 1.
    (v)    Compute private exponent d such that d = e^(-1) mod phi(n).


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






### ElGamal - Short Notes (TXT Format)

ElGamal is an asymmetric encryption algorithm based on the difficulty of the discrete logarithm problem.

Key Generation:
        Choose a large prime p.
        Choose generator g (primitive root mod p).
        Choose private key x (random).
        Compute public key y = g^x mod p.



Public Key: (p, g, y)
Private Key: x



Encryption:
Choose random k.
   (i)  c1 = g^k mod p
   (ii)  s = y^k mod p
   (iii)   c2 = (M * s) mod p


Ciphertext = (c1, c2)



Decryption:
Compute s = c1^x mod p
Compute modular inverse s_inv = s^(-1) mod p
Recover message: M = (c2 * s_inv) mod p



Notes:
        Security is based on discrete logarithm problem.
        Probabilistic encryption (uses random k).
        Used in PGP and secure communication protocols.




git tag follow these rules:
    The -m flag must come right after the tag name.
    You cannot put spaces or text between the tag name and -m.
    The tag message must be inside quotes.



'