#include <iostream>
#include <string>
#include <cstring>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <thread>
#include <csignal>


#define PORT 8080
#define MAX_CLIENTS 2

// Publicly available info
#define BASE 3
#define MOD 19
#define MAX_EXP 100

using namespace std;

int c1, c2, s1;

void signalHandler(int signum) {
    cout << "\nClosing server\n";
    close(c1);
    close(c2);
    close(s1);
    exit(0);
}

int shared_secret = -1;

// Function to initialize the RC4 key-scheduling algorithm (KSA)
void RC4Initialize(unsigned char *state, const unsigned char *key, int keylen) {
    int i, j = 0, t;

    for (i = 0; i < 256; ++i) {
        state[i] = i;
    }
    for (i = 0; i < 256; ++i) {
        j = (j + state[i] + key[i % keylen]) % 256;
        t = state[i];
        state[i] = state[j];
        state[j] = t;
    }
}

// Function to perform the RC4 pseudo-random generation algorithm (PRGA)
void RC4(unsigned char *buffer, int length, unsigned char *state) {
    int i = 0, j = 0, t;
    unsigned char x;

    for (int k = 0; k < length; ++k) {
        i = (i + 1) % 256;
        j = (j + state[i]) % 256;
        t = state[i];
        state[i] = state[j];
        state[j] = t;
        x = state[(state[i] + state[j]) % 256];
        buffer[k] ^= x;
    }
}

// Wrapper function to set up key and call the RC4 algorithm
void RC4EncryptDecrypt(string &data, const string &key) {
    unsigned char state[256];
    unsigned char keyBytes[key.size()];
    memcpy(keyBytes, key.c_str(), key.size());
    
    RC4Initialize(state, keyBytes, key.size());
    
    unsigned char dataBytes[data.size()];
    memcpy(dataBytes, data.c_str(), data.size());
    
    RC4(dataBytes, data.size(), state);
    
    data = string(reinterpret_cast<char*>(dataBytes), data.size());
}

int modExp(int exp, int curr=BASE) {
    if (exp == 0) return 1;
    if (exp == 1) return curr;
    return (curr * modExp(exp - 1, curr)) % MOD;
}

int bruteForce(int half_key) {
    int key = 1;
    for (int exp = 0; exp < MAX_EXP; exp++) {
        if(key == half_key) return exp;
        key = (key * BASE) % MOD;
    }
    return -1;
}

void handleClient(int clientSocket1, int clientSocket2) {
    int bytesRead;
    int c1_half_key, c2_half_key;
    int c1_key, c2_key;

    char buffer[1024];
    
    bytesRead = recv(clientSocket1, buffer, 1024, 0);
    buffer[bytesRead] = '\0';
    c1_half_key = stoi(buffer);
    c1_key = bruteForce(c1_half_key);
    send(clientSocket2, buffer, bytesRead, 0);

    bytesRead = recv(clientSocket2, buffer, 1024, 0);
    buffer[bytesRead] = '\0';
    c2_half_key = stoi(buffer);
    shared_secret = modExp(c1_key, c2_half_key);
    send(clientSocket1, buffer, bytesRead, 0);
    string key = to_string(shared_secret);

    cout << "Shared secret: " << key << endl;

    thread client1Thread([&](){
        char buffer[1024];
        while (true) {
            bytesRead = recv(clientSocket1, buffer, 1024, 0);
            if (bytesRead <= 0) break;
            buffer[bytesRead] = '\0';

            string receivedMessage(buffer);
            cout<<"Encrypted msg from C2: "<<receivedMessage<<endl;
            RC4EncryptDecrypt(receivedMessage, key);
            cout << "Decrypted msg from C2: " << receivedMessage << endl;

            send(clientSocket2, buffer, bytesRead, 0);
        }
    });

    thread client2Thread([&](){
        char buffer[1024];
        while (true) {
            bytesRead = recv(clientSocket2, buffer, 1024, 0);
            if (bytesRead <= 0) break;
            buffer[bytesRead] = '\0';

            string receivedMessage(buffer);
            cout<<"Encrypted msg from C1: "<<receivedMessage<<endl;
            RC4EncryptDecrypt(receivedMessage, key);
            cout << "Decrypted msg from C1: " << receivedMessage << endl;

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