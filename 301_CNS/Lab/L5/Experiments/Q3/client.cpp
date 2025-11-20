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


void chat(int clientSocket) {
    char buffer[1024];
    string message;
    string key = to_string(shared_secret);

    thread receiveThread([&](){
        while (true) {
            int bytesRead = recv(clientSocket, buffer, 1024, 0);
            if (bytesRead <= 0) break;
            buffer[bytesRead] = '\0';
            string receivedMessage(buffer);
            cout<<"Encrypted msg: "<<receivedMessage<<endl;
            RC4EncryptDecrypt(receivedMessage, key);
            cout << "Decrypted msg: " << receivedMessage << endl;
        }
    });

    while (true) {
        getline(cin, message);
        RC4EncryptDecrypt(message, key);
        send(clientSocket, message.c_str(), message.length(), 0);
        cout << "Sent: " << message << endl;
    }

    receiveThread.join();
    // close(clientSocket);
}

void keyExchange(int clientSocket) {
    char buffer[1024];
    string message;

    srand(time(0));
    int my_secret = rand() % MAX_EXP;
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
    chat(clientSocket);
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