#include <iostream>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <cstring>
#include <arpa/inet.h>
#include <unistd.h>

using namespace std;

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

int main() {
    srand(time(0));

    int sock = 0;
    struct sockaddr_in serv_addr;

    sock = socket(AF_INET, SOCK_STREAM, 0);
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(8080);

    inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr);
    connect(sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr));

    // Receive public key
    long long pubKey[3];
    read(sock, pubKey, sizeof(pubKey));

    long long p = pubKey[0], g = pubKey[1], y = pubKey[2];
    cout << "Client: Received public key (p=" << p << ", g=" << g << ", y=" << y << ")\n";

    // Input message
    long long M;
    cout << "Enter a numeric message (M < " << p << "): ";
    cin >> M;

    // Choose random k
    long long k = rand() % (p - 2) + 1;

    // Encrypt
    long long c1 = modExp(g, k, p);
    long long s = modExp(y, k, p);
    long long c2 = (M * s) % p;

    long long cipher[2] = {c1, c2};

    // Send ciphertext
    send(sock, cipher, sizeof(cipher), 0);

    cout << "Client: Sent ciphertext (c1=" << c1 << ", c2=" << c2 << ")\n";

    close(sock);
    return 0;
}

