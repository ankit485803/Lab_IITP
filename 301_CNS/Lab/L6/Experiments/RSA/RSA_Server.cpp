#include <iostream>
#include <cstring>
#include <unistd.h>
#include <arpa/inet.h>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>

#define PORT 8080
#define BUFFER_SIZE 4096

RSA* generateRSAKeyPair() {
    RSA* rsa = RSA_new();
    BIGNUM* bn = BN_new();
    BN_set_word(bn, RSA_F4);
    RSA_generate_key_ex(rsa, 2048, bn, nullptr);
    BN_free(bn);
    return rsa;
}

std::string rsaDecrypt(RSA* rsa, const std::string& encryptedText) {
    std::string decrypted(RSA_size(rsa), '\0');
    int len = RSA_private_decrypt(encryptedText.size(),
                                  (const unsigned char*)encryptedText.c_str(),
                                  (unsigned char*)decrypted.data(),
                                  rsa, RSA_PKCS1_OAEP_PADDING);
    if (len == -1) {
        ERR_print_errors_fp(stderr);
        throw std::runtime_error("Decryption failed");
    }
    decrypted.resize(len);
    return decrypted;
}

std::string getPublicKeyPem(RSA* rsa) {
    BIO* bio = BIO_new(BIO_s_mem());
    PEM_write_bio_RSAPublicKey(bio, rsa);
    char* keyData;
    long len = BIO_get_mem_data(bio, &keyData);
    std::string key(keyData, len);
    BIO_free(bio);
    return key;
}

int main() {
    int server_fd, new_socket;
    struct sockaddr_in address;
    int opt = 1;
    socklen_t addrlen = sizeof(address);
    char buffer[BUFFER_SIZE] = {0};

    RSA* rsa = generateRSAKeyPair();
    std::string pubKey = getPublicKeyPem(rsa);
    

    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) == 0) {
        perror("Socket failed");
        exit(EXIT_FAILURE);
    }

    setsockopt(server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof(opt));
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);

    if (bind(server_fd, (struct sockaddr*)&address, sizeof(address)) < 0) {
        perror("Bind failed");
        exit(EXIT_FAILURE);
    }

    listen(server_fd, 3);
    std::cout << "Server waiting for connection..." << std::endl;

    if ((new_socket = accept(server_fd, (struct sockaddr*)&address, &addrlen)) < 0) {
        perror("Accept failed");
        exit(EXIT_FAILURE);
    }

    send(new_socket, pubKey.c_str(), pubKey.size(), 0);
    std::cout << "Public key sent to client." << pubKey << std::endl;

    int valread = read(new_socket, buffer, BUFFER_SIZE);
    std::string encryptedMsg(buffer, valread);

    std::string decryptedMsg = rsaDecrypt(rsa, encryptedMsg);
    std::cout << "Decrypted message: " << decryptedMsg << std::endl;

    close(new_socket);
    close(server_fd);
    RSA_free(rsa);
    return 0;
}
