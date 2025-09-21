#include <iostream>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <string>
#include <ctime>
#include <algorithm>

#pragma comment(lib, "ws2_32.lib")


using namespace std;

string MakeCRC(const string& bitString) {
    char CRC[8] = {0};
    for (char ch : bitString) {
        char DoInvert = (ch == '1') ^ CRC[7];
        CRC[7] = CRC[6];
        CRC[6] = CRC[5];
        CRC[5] = CRC[4];
        CRC[4] = CRC[3];
        CRC[3] = CRC[2];
        CRC[2] = CRC[1] ^ DoInvert;
        CRC[1] = CRC[0] ^ DoInvert;
        CRC[0] = DoInvert;
    }

    string res(8, '0');
    for (int i = 0; i < 8; ++i)
        res[7 - i] = CRC[i] ? '1' : '0';

    return res;
}

bool check(const string& buffer) {
    string arr = MakeCRC(buffer);
    return all_of(arr.begin(), arr.end(), [](char c) { return c == '0'; });
}

string probEr(string data, int n) {
    for (size_t i = 0; i < data.length(); ++i) {
        if (rand() % n == 0)
            data[i] = (data[i] == '0') ? '1' : '0';
    }
    cout << "data Sent: " << data << " n=" << n << endl;
    return data;
}

int main() {
    WSADATA wsaData;
    SOCKET serverSocket, clientSocket;
    struct sockaddr_in serverAddr, clientAddr;
    int addrLen = sizeof(clientAddr);
    char buffer[1024];
    int n = 100;

    srand(static_cast<unsigned>(time(nullptr)));

    cout << "Starting Server..." << endl;

    if (WSAStartup(MAKEWORD(2, 2), &wsaData)) {
        cerr << "WSAStartup failed\n";
        return 1;
    }

    serverSocket = socket(AF_INET, SOCK_STREAM, 0);
    if (serverSocket == INVALID_SOCKET) {
        cerr << "Socket creation failed\n";
        WSACleanup();
        return 1;
    }

    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(8080);
    serverAddr.sin_addr.s_addr = INADDR_ANY;

    if (bind(serverSocket, (struct sockaddr*)&serverAddr, sizeof(serverAddr)) == SOCKET_ERROR) {
        cerr << "Bind failed\n";
        closesocket(serverSocket);
        WSACleanup();
        return 1;
    }

    listen(serverSocket, SOMAXCONN);
    cout << "Server is listening on port 8080...\n";

    clientSocket = accept(serverSocket, (struct sockaddr*)&clientAddr, &addrLen);
    if (clientSocket == INVALID_SOCKET) {
        cerr << "Accept failed\n";
        closesocket(serverSocket);
        WSACleanup();
        return 1;
    }

    cout << "Client connected.\n";

    while (true) {
        int bytesRead = recv(clientSocket, buffer, sizeof(buffer), 0);
        if (bytesRead <= 0) break;

        string data(buffer, bytesRead);
        bool isValid = check(data);

        string response = (isValid ? "1" : "0") + MakeCRC(isValid ? "1" : "0");
        response = probEr(response, n);

        send(clientSocket, response.c_str(), response.size(), 0);
    }

    closesocket(clientSocket);
    closesocket(serverSocket);
    WSACleanup();
    return 0;
}
