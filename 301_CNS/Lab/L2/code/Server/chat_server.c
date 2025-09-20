#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

#define PORT 8080
#define MAX 1024

int main() {
    int server_fd, new_socket;
    struct sockaddr_in address;
    int addrlen = sizeof(address);
    char buffer[MAX];
    char msg[MAX];

    // create socket
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
        perror("socket failed");
        exit(EXIT_FAILURE);
    }

    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);

    // bind
    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0) {
        perror("bind failed");
        exit(EXIT_FAILURE);
    }

    // listen
    if (listen(server_fd, 3) < 0) {
        perror("listen");
        exit(EXIT_FAILURE);
    }

    printf("Server listening on port %d...\n", PORT);

    if ((new_socket = accept(server_fd, (struct sockaddr *)&address, (socklen_t*)&addrlen)) < 0) {
        perror("accept");
        exit(EXIT_FAILURE);
    }

    printf("Client connected.\n");

    while (1) {
        memset(buffer, 0, MAX);
        // receive message from client
        int valread = read(new_socket, buffer, MAX);
        if (valread <= 0) break;

        if (strncmp(buffer, "exit", 4) == 0) {
            printf("Client exited the chat.\n");
            break;
        }

        printf("Client: %s\n", buffer);

        // server reply
        printf("Server: ");
        fgets(msg, MAX, stdin);
        msg[strcspn(msg, "\n")] = 0; // remove newline
        send(new_socket, msg, strlen(msg), 0);

        if (strncmp(msg, "exit", 4) == 0) {
            printf("Server exited the chat.\n");
            break;
        }
    }

    close(new_socket);
    close(server_fd);
    return 0;
}
