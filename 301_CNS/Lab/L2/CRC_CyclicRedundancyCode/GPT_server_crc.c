// CRC Server in C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>             // for close()
#include <sys/socket.h>         // for socket functions
#include <netinet/in.h>         // for sockaddr_in

#define MAX_BITS 100            // Max size for input and encoded data
#define PORT 8080               // Port number for the server

char t[MAX_BITS], cs[MAX_BITS], g[] = "1101";  // t = data, cs = checksum, g = generator
int a, e, c;                    // a = length of input, e = counters, c = loop

// XOR operation for CRC division
void xor_crc() {
    for (c = 1; c < strlen(g); c++)
        cs[c] = (cs[c] == g[c]) ? '0' : '1';
}

// Perform CRC division and get remainder in cs[]
void crc_encode() {
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
    int server_fd, new_socket;
    struct sockaddr_in address;
    int opt = 1;
    int addrlen = sizeof(address);

    // Create socket
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
        perror("Socket creation failed");
        exit(EXIT_FAILURE);
    }
    printf("\n✅ Socket created successfully");

    // Reuse port
    if (setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT,
                   &opt, sizeof(opt))) {
        perror("setsockopt");
        exit(EXIT_FAILURE);
    }

    // Server address setup
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);
    printf("\n✅ Connected to port %d", PORT);

    // Bind socket
    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0) {
        perror("Bind failed");
        exit(EXIT_FAILURE);
    }
    printf("\n✅ Bind complete");

    // Listen for incoming connections
    if (listen(server_fd, 3) < 0) {
        perror("Listen failed");
        exit(EXIT_FAILURE);
    }
    printf("\n🔁 Listening for client...\n");

    // Accept client
    if ((new_socket = accept(server_fd, (struct sockaddr *)&address,
                             (socklen_t *)&addrlen)) < 0) {
        perror("Accept failed");
        exit(EXIT_FAILURE);
    }

    // Input data
    printf("\n📥 Enter data bits (e.g., 101010): ");
    scanf("%s", t);
    a = strlen(t);

    // Append N-1 zeroes
    int N = strlen(g);
    for (e = a; e < a + N - 1; e++)
        t[e] = '0';
    t[e] = '\0';

    // Calculate CRC
    crc_encode();

    // Append checksum to original data
    for (e = a; e < a + N - 1; e++)
        t[e] = cs[e - a];
    t[e] = '\0';

    printf("\n✅ Checksum: %s", cs);
    printf("\n📤 Final codeword to send: %s", t);

    // Ask if user wants to simulate an error
    printf("\n\n💡 Send options:");
    printf("\n 1 - Send correct data");
    printf("\n 0 - Send erroneous data\nYour choice: ");
    scanf("%d", &e);

    // Inject error if requested
    if (e == 0) {
        do {
            printf("\nEnter position to insert error (1 to %d): ", a + N - 1);
            scanf("%d", &e);
        } while (e < 1 || e > a + N - 1);

        // Flip the bit
        t[e - 1] = (t[e - 1] == '0') ? '1' : '0';
        printf("\n⚠️ Erroneous data: %s", t);
    }

    // Send data to client
    send(new_socket, t, strlen(t), 0);
    printf("\n📨 Data sent to client.\n");

    // Close sockets
    close(new_socket);
    close(server_fd);
    printf("\n🔒 Server closed.\n");

    return 0;
}
