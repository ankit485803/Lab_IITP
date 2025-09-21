


// Ques. I want to transfer the newtowrk_Img.jpg file transfer fronm client side to server


/*


✅ Why use "rb"? of img transfer time hmko kam aayega

You're transferring a binary file (like a .jpeg image), not plain text. Using "rb" ensures:
No newline conversion (which can corrupt binary files on some systems).
The file is read exactly as-is, byte-for-byte.
If you used just "r" (text mode), some platforms (like Windows) might alter newline characters (\n ↔ \r\n) during read/write — corrupting binary data like images, PDFs, etc.





| Mode   | Meaning                  | When to use                       |
| ------ | ------------------------ | --------------------------------- |
| `"r"`  | Read text file           | For `.txt`, `.csv`, etc.          |
| `"rb"` | Read binary file         | For `.jpeg`, `.png`, `.zip`, etc. |
| `"w"`  | Write text (overwrite)   | Writes/creates text files         |
| `"wb"` | Write binary (overwrite) | Writes/creates binary files       |



*/

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
    FILE *fp;

    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        printf("\n Socket creation error \n");
        return -1;
    }

    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(PORT);

    if (inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr) <= 0) {
        printf("\nInvalid address/ Address not supported \n");
        return -1;
    }

    if (connect(sock, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0) {
        printf("\nConnection Failed \n");
        return -1;
    }

    printf("Connected to server.\n");

    // open file to send
    fp = fopen("computer.jpeg", "rb");
    if (fp == NULL) {
        perror("File");
        close(sock);
        exit(EXIT_FAILURE);
    }

    // send file chunks
    int n;
    while ((n = fread(buffer, sizeof(char), MAX, fp)) > 0) {
        if (send(sock, buffer, n, 0) == -1) {
            perror("send");
            break;
        }
    }

    printf("File sent successfully.\n");

    fclose(fp);
    close(sock);
    return 0;
}
