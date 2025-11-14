#include <iostream>
#include <cstring>
#include <unistd.h>
#include <arpa/inet.h>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>

#define PORT 8080
#define BUFFER_SIZE 4096

RSA* createPublicRSA(const std::string& key) {
    BIO* bio = BIO_new_mem_buf((void*)key.c_str(), -1);
    RSA* rsa = PEM_read_bio_RSAPublicKey(bio, nullptr, nullptr, nullptr);
    BIO_free(bio);
    if (!rsa) throw std::runtime_error("Failed to create RSA from public key");
    return rsa;
}

std::string rsaEncrypt(RSA* rsa, const std::string& message) {
    std::string encrypted(RSA_size(rsa), '\0');
    int len = RSA_public_encrypt(message.size(),
                                 (const unsigned char*)message.c_str(),
                                 (unsigned char*)encrypted.data(),
                                 rsa, RSA_PKCS1_OAEP_PADDING);
    if (len == -1) {
        ERR_print_errors_fp(stderr);
        throw std::runtime_error("Encryption failed");
    }
    encrypted.resize(len);
    return encrypted;
}

int main() {
    int sock = 0;
    struct sockaddr_in serv_addr;
    char buffer[BUFFER_SIZE] = {0};

    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        std::cerr << "Socket creation error" << std::endl;
        return -1;
    }

    serv_addr.sin_family = AF_INET;
    serv_addr.sin_port = htons(PORT);

    if (inet_pton(AF_INET, "127.0.0.1", &serv_addr.sin_addr) <= 0) {
        std::cerr << "Invalid address" << std::endl;
        return -1;
    }

    if (connect(sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) < 0) {
        std::cerr << "Connection failed" << std::endl;
        return -1;
    }

    int valread = read(sock, buffer, BUFFER_SIZE);
    std::string pubKey(buffer, valread);
    RSA* rsa = createPublicRSA(pubKey);
    std:: cout << rsa << std::endl;
    std::string message;
    std::cout << "Enter message to encrypt: ";
    std::getline(std::cin, message);

    std::string encryptedMsg = rsaEncrypt(rsa, message);
    send(sock, encryptedMsg.c_str(), encryptedMsg.size(), 0);
    std::cout << encryptedMsg << std:: endl;
    std::cout << "Encrypted message sent to server." << std::endl;

    RSA_free(rsa);
    close(sock);
    return 0;
}
