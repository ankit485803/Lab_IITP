#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

#define PORT 8080
#define MAX 1024

int main() {
    int sock = 0;
    struct sockaddr_in serv_addr;
    char buffer[MAX];
    char msg[MAX];

    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        printf("\n Socket creation error \n");
        return -1;
    }

    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(PORT);

    // convert IPv4 and IPv6 addresses from text to binary form
    if (inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr) <= 0) {
        printf("\nInvalid address/ Address not supported \n");
        return -1;
    }

    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        printf("\nConnection Failed \n");
        return -1;
    }

    printf("Connected to server. Type 'exit' to quit.\n");

    while (1) {
        // client sends
        printf("Client: ");
        fgets(msg, MAX, stdin);
        msg[strcspn(msg, "\n")] = 0;
        send(sock, msg, strlen(msg), 0);

        if (strncmp(msg, "exit", 4) == 0) {
            printf("Client exited the chat.\n");
            break;
        }

        // receive from server
        memset(buffer, 0, MAX);
        int valread = read(sock, buffer, MAX);
        if (valread <= 0) break;

        if (strncmp(buffer, "exit", 4) == 0) {
            printf("Server exited the chat.\n");
            break;
        }

        printf("Server: %s\n", buffer);
    }

    close(sock);
    return 0;
}
