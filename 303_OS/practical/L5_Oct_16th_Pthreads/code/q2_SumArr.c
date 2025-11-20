

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
 
#define SIZE 10
#define THREADS 2
 
int arr[SIZE] = {1,2,3,4,5,6,7,8,9,10};
long total_sum = 0;
pthread_mutex_t lock;
 
void* sum_part(void* arg) {
 int thread_id = *(int*)arg;
 int start = thread_id * (SIZE / THREADS);
 int end = (thread_id + 1) * (SIZE / THREADS);
 
 long local_sum = 0;
 for (int i = start; i < end; i++) {
 local_sum += arr[i];
 }
 
 // Protect shared variable using mutex
 pthread_mutex_lock(&lock);
 total_sum += local_sum;
 pthread_mutex_unlock(&lock);
 
 printf("Thread %d partial sum = %ld\n", thread_id + 1, local_sum);
 return NULL;
}
 
int main() {
 pthread_t tid[THREADS];
 int ids[THREADS];
 pthread_mutex_init(&lock, NULL);
 
 for (int i = 0; i < THREADS; i++) {
 ids[i] = i;
 pthread_create(&tid[i], NULL, sum_part, &ids[i]);
 }
 
 for (int i = 0; i < THREADS; i++)
 pthread_join(tid[i], NULL);
 
 printf("Final total sum = %ld\n", total_sum);
 pthread_mutex_destroy(&lock);
 return 0;
}
 