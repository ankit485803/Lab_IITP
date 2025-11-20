#include <iostream>
#include <string>
#include <cstring>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <thread>
#include <csignal>

// Publicly available info
#define BASE 3
#define MOD 19

using namespace std;

int c1, c2, s1;

void signalHandler(int signum) {
    cout << "\nClosing server\n";
    close(c1);
    close(c2);
    close(s1);
    exit(0);
}

#define PORT 8080
#define MAX_CLIENTS 2

void handleClient(int clientSocket1, int clientSocket2) {
    char buffer[1024];
    int bytesRead;

    thread client1Thread([&](){
        while (true) {
            bytesRead = recv(clientSocket1, buffer, 1024, 0);
            if (bytesRead <= 0) break;
            buffer[bytesRead] = '\0';
            send(clientSocket2, buffer, bytesRead, 0);
        }
    });

    thread client2Thread([&](){
        while (true) {
            bytesRead = recv(clientSocket2, buffer, 1024, 0);
            if (bytesRead <= 0) break;
            buffer[bytesRead] = '\0';
            send(clientSocket1, buffer, bytesRead, 0);
        }
    });
    
    client1Thread.join();
    client2Thread.join();

    close(clientSocket1);
    close(clientSocket2);
}

int main() {
    signal(SIGINT, signalHandler);
    int serverSocket;
    struct sockaddr_in serverAddr, clientAddr;
    socklen_t addrLen = sizeof(clientAddr);
    int clientSockets[MAX_CLIENTS] = {0};

    serverSocket = socket(AF_INET, SOCK_STREAM, 0);
    if (serverSocket == 0) {
        cerr << "Socket failed!" << endl;
        exit(EXIT_FAILURE);
    }

    serverAddr.sin_family = AF_INET;
    serverAddr.sin_addr.s_addr = INADDR_ANY;
    serverAddr.sin_port = htons(PORT);

    if (bind(serverSocket, (struct sockaddr *)&serverAddr, sizeof(serverAddr)) < 0) {
        cerr << "Bind failed!" << endl;
        exit(EXIT_FAILURE);
    }

    if (listen(serverSocket, 3) < 0) {
        cerr << "Listen failed!" << endl;
        exit(EXIT_FAILURE);
    }

    cout << "Server listening on port " << PORT << endl;

    for (int i = 0; i < MAX_CLIENTS; ++i) {
        clientSockets[i] = accept(serverSocket, (struct sockaddr *)&clientAddr, &addrLen);
        if (clientSockets[i] < 0) {
            cerr << "Accept failed!" << endl;
            exit(EXIT_FAILURE);
        }
        cout << "Client " << i + 1 << " connected" << endl;
    }

    c1 = clientSockets[0];
    c2 = clientSockets[1];
    s1 = serverSocket;

    handleClient(clientSockets[0], clientSockets[1]);

    close(serverSocket);
    return 0;
}