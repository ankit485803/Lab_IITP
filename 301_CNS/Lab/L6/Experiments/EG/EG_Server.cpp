#include <iostream>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <cstring>
#include <arpa/inet.h>
#include <unistd.h>

using namespace std;

// Utility function for modular exponentiation
long long modExp(long long base, long long exp, long long mod) {
    long long result = 1;
    base %= mod;
    while (exp > 0) {
        if (exp % 2 == 1) result = (result * base) % mod;
        base = (base * base) % mod;
        exp /= 2;
    }
    return result;
}

// ElGamal key generation
void generateKeys(long long &p, long long &g, long long &x, long long &y) {
    p = 467;          // A small prime number
    g = 2;            // Primitive root mod p
    x = rand() % (p - 2) + 1; // Private key
    y = modExp(g, x, p);      // Public key
}

int main() {
    srand(time(0));

    // Generate ElGamal keys
    long long p, g, x, y;
    generateKeys(p, g, x, y);

    cout << "Server: Generated keys:\n";
    cout << "p = " << p << ", g = " << g << ", x (private) = " << x << ", y = " << y << endl;

    // Create socket
    int server_fd, new_socket;
    struct sockaddr_in address;
    int opt = 1;
    int addrlen = sizeof(address);

    server_fd = socket(AF_INET, SOCK_STREAM, 0);
    setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt));

    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(8080);

    bind(server_fd, (struct sockaddr*)&address, sizeof(address));
    listen(server_fd, 3);
    cout << "Server: Waiting for connection..." << endl;

    new_socket = accept(server_fd, (struct sockaddr*)&address, (socklen_t*)&addrlen);
    cout << "Server: Client connected!\n";

    // Send public key to client
    long long pubKey[3] = {p, g, y};
    send(new_socket, pubKey, sizeof(pubKey), 0);

    // Receive ciphertext (c1, c2)
    long long cipher[2];
    read(new_socket, cipher, sizeof(cipher));
    long long c1 = cipher[0], c2 = cipher[1];

    cout << "Server: Received ciphertext (c1=" << c1 << ", c2=" << c2 << ")\n";

    // Decrypt message: M = c2 * (c1^x)^(-1) mod p
    long long s = modExp(c1, x, p);
    long long s_inv = modExp(s, p - 2, p); // modular inverse using Fermat
    long long M = (c2 * s_inv) % p;

    cout << "Server: Decrypted message = " << M << endl;

    close(new_socket);
    close(server_fd);
    return 0;
}

