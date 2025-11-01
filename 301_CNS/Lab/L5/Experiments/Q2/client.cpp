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
#define MAX_EXP 100

using namespace std;

int c1;

void signalHandler(int signum) {
    cout << "\nClosing client\n";
    close(c1);
    exit(0);
}

int modExp(int exp, int curr=BASE) {
    if (exp == 0) return 1;
    if (exp == 1) return curr;
    return (curr * modExp(exp - 1, curr)) % MOD;
}

#define PORT 8080
#define SERVER_ADDRESS "127.0.0.1"

int shared_secret = 0;

void keyExchange(int clientSocket) {
    char buffer[1024];
    string message;

    srand(time(0));
    int my_secret = rand() % MAX_EXP;
    cout << my_secret << endl;
    //int my_secret = 7;
    int my_public = modExp(my_secret);

    thread receiveThread([&](){
            int bytesRead = recv(clientSocket, buffer, 1024, 0);
            if (bytesRead <= 0){
                cout << "Error in communication" << endl;
                return;
            }
            buffer[bytesRead] = '\0';
            cout << "Received: " << buffer << endl;

            int other_public = stoi(buffer);
            shared_secret = modExp(my_secret, other_public);
            cout << "Shared secret key: " << shared_secret << endl;
            cout << "Key exchange complete" << endl;
    });

    send(clientSocket, to_string(my_public).c_str(), to_string(my_public).length(), 0);
    cout<<"Sent: "<<to_string(my_public).c_str()<<endl;

    receiveThread.join();
    close(clientSocket);
}


void chat(int clientSocket) {
    char buffer[1024];
    string message;

    thread receiveThread([&](){
        while (true) {
            int bytesRead = recv(clientSocket, buffer, 1024, 0);
            if (bytesRead <= 0) break;
            buffer[bytesRead] = '\0';
            cout << "Received: " << buffer << endl;
        }
    });

    while (true) {
        getline(cin, message);
        send(clientSocket, message.c_str(), message.length(), 0);
        cout<<"Sent: "<<message<<endl;
    }

    receiveThread.join();
    close(clientSocket);
}

int main() {
    signal(SIGINT, signalHandler);
    int clientSocket;
    struct sockaddr_in serverAddr;

    clientSocket = socket(AF_INET, SOCK_STREAM, 0);
    if (clientSocket == 0) {
        cerr << "Socket creation failed!" << endl;
        exit(EXIT_FAILURE);
    }

    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(PORT);

    if (inet_pton(AF_INET, SERVER_ADDRESS, &serverAddr.sin_addr) <= 0) {
        cerr << "Invalid address or Address not supported!" << endl;
        exit(EXIT_FAILURE);
    }

    if (connect(clientSocket, (struct sockaddr *)&serverAddr, sizeof(serverAddr)) < 0) {
        cerr << "Connection failed!" << endl;
        exit(EXIT_FAILURE);
    }

    c1 = clientSocket;

    cout << "Connected to server" << endl;

    // chat(clientSocket);
    keyExchange(clientSocket);

    return 0;
}
