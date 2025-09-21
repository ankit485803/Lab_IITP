// CRC Client in C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>             // for read(), close()
#include <arpa/inet.h>          // for inet_pton()
#include <sys/socket.h>         // for socket functions
#include <netinet/in.h>         // for sockaddr_in

#define MAX_BITS 100            // Max size for input/received data
#define PORT 8080

char t[MAX_BITS], cs[MAX_BITS], g[] = "1101";  // t = received data, cs = checksum, g = generator
int a, e, c;

// XOR operation used in CRC division
void xor_crc() {
    for (c = 1; c < strlen(g); c++)
        cs[c] = (cs[c] == g[c]) ? '0' : '1';
}

// Perform CRC division on received data
void crc_check() {
    int N = strlen(g);
    for (e = 0; e < N; e++)
        cs[e] = t[e];

    do {
        if (cs[0] == '1')
            xor_crc();

        for (c = 0; c < N - 1; c++)
            cs[c] = cs[c + 1];
        cs[c] = t[e++];
    } while (e <= a + N - 1);
}

int main() {
    int sock = 0, valread;
    struct sockaddr_in serv_addr;

    // Create socket
    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        perror("❌ Socket creation error");
        return -1;
    }

    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(PORT);

    // Convert localhost IP string to binary
    if (inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr) <= 0) {
        perror("❌ Invalid address / Not supported");
        return -1;
    }

    // Connect to server
    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        perror("❌ Connection Failed");
        return -1;
    }

    // Receive encoded data from server
    valread = read(sock, t, MAX_BITS);
    t[valread] = '\0';  // Null-terminate the received string

    printf("\n📥 Encoded data received: %s\n", t);

    a = strlen(t);

    // Add trailing 0s for division (needed for CRC calculation)
    int N = strlen(g);
    for (e = a; e < a + N - 1; e++)
        t[e] = '0';
    t[e] = '\0';

    // Perform CRC check on received data
    crc_check();

    printf("🧮 CRC Remainder: %s\n", cs);

    // Check if any bit in remainder is non-zero
    int error = 0;
    for (e = 0; e < N - 1; e++) {
        if (cs[e] == '1') {
            error = 1;
            break;
        }
    }

    if (error)
        printf("\n❌ Error detected in received data.\n\n");
    else
        printf("\n✅ No error detected. Data is correct.\n\n");

    close(sock);
    return 0;
}
