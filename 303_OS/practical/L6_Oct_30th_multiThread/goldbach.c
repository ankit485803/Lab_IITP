

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>

#define N 100000  // limit to verify Goldbach's conjecture

bool primes[N + 1];  // primes[i] = true if i is prime






// Function to generate primes using Sieve of Eratosthenes
void sieve() {
    for (int i = 0; i <= N; i++)
        primes[i] = true;     // assume all are prime initially

    primes[0] = primes[1] = false;  // 0 and 1 are not prime

    for (int i = 2; i * i <= N; i++) {
        if (primes[i]) {
            for (int j = i * i; j <= N; j += i)
                primes[j] = false;  // mark multiples as not prime
        }
    }
}




// Verify Goldbach's conjecture for even numbers up to N
void verify_goldbach() {
    printf("Verifying Goldbach’s Conjecture up to %d...\n", N);
    int failed = 0;

    for (int n = 4; n <= N; n += 2) {  // even numbers > 2
        int found = 0;
        for (int i = 2; i <= n / 2; i++) {
            if (primes[i] && primes[n - i]) {
                found = 1;
                break; // found a valid pair
            }
        }
        if (!found) {
            printf("Conjecture failed for %d!\n", n);
            failed = 1;
            break;
        }
    }

    if (!failed)
        printf("Goldbach’s Conjecture holds for all even numbers up to %d\n", N);
}








int main() {
    sieve();
    verify_goldbach();
    return 0;
}
