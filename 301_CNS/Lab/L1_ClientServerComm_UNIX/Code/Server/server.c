/*
Concept: TCP Client-Server Model

• Server:
1.  Create socket
2.  Bind to IP/port
3.  Listen for connections
4.  Accept client connection
5.  Receive data from client
6.  Send response back (echo)
7.  Close socket
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

#define PORT 8080
#define BUFFER_SIZE 1024

int main() {
    int server_fd, client_socket;
    struct sockaddr_in address;
    socklen_t addr_len = sizeof(address);
    char buffer[BUFFER_SIZE];

    // 1. Create socket
    server_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (server_fd == 0) {
        perror("Socket failed");
        exit(EXIT_FAILURE);
    }

    // 2. Bind socket to port
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);

    if (bind(server_fd, (struct sockaddr *)&address, sizeof(address)) < 0) {
        perror("Bind failed");
        exit(EXIT_FAILURE);
    }

    // 3. Listen for connections
    if (listen(server_fd, 3) < 0) {
        perror("Listen failed");
        exit(EXIT_FAILURE);
    }

    printf("Server listening on port %d...\n", PORT);

    // 4. Accept connection
    client_socket = accept(server_fd, (struct sockaddr *)&address, &addr_len);
    if (client_socket < 0) {
        perror("Accept failed");
        exit(EXIT_FAILURE);
    }

    printf("Connection established with client.\n");

    // 5. Receive message
    ssize_t bytes_read = recv(client_socket, buffer, BUFFER_SIZE, 0);
    buffer[bytes_read] = '\0';
    printf("Received message from client: %s\n", buffer);

    // 6. Echo back to client
    send(client_socket, buffer, strlen(buffer), 0);

    // 7. Close sockets
    close(client_socket);
    close(server_fd);

    return 0;
}
