#include <iostream>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <string>
#include <ctime>
#include <algorithm>  
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

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
    if (buffer[0] == '1') {
        for (char c : arr)
            if (c != '0') return false;
        return true;
    }
    return false;
}

string probEr(string data, int n) {
    for (size_t i = 0; i < data.length(); ++i) {
        if (rand() % n == 0)
            data[i] = (data[i] == '0') ? '1' : '0';
    }
    cout << "Sent (with error): " << data << endl;
    return data;
}

int main() {
    WSADATA wsaData;
    SOCKET sock;
    struct sockaddr_in serverAddr;
    char buffer[1024];
    int n = 100;

    srand(static_cast<unsigned>(time(nullptr)));

    cout << "Starting Client..." << endl;

    if (WSAStartup(MAKEWORD(2, 2), &wsaData)) {
        cerr << "WSAStartup failed\n";
        return 1;
    }

    sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock == INVALID_SOCKET) {
        cerr << "Socket creation failed\n";
        WSACleanup();
        return 1;
    }

    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(8080);
    serverAddr.sin_addr.s_addr = inet_addr("127.0.0.1");

    if (connect(sock, (struct sockaddr*)&serverAddr, sizeof(serverAddr)) < 0) {
        cerr << "Connection failed\n";
        closesocket(sock);
        WSACleanup();
        return 1;
    }

    while (true) {
        string message = "100000111";
        message += MakeCRC(message);
        string toSend = probEr(message, n);

        send(sock, toSend.c_str(), toSend.length(), 0);

        int bytesRead = recv(sock, buffer, sizeof(buffer), 0);
        if (bytesRead <= 0) break;

        string recvStr(buffer, bytesRead);
        bool flag = check(recvStr);
        cout << "Received: " << recvStr << " → Flag: " << flag << endl;

        if (flag) break;
    }

    closesocket(sock);
    WSACleanup();
    return 0;
}
