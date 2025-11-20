


:'


| Concept                     | Explanation                                                                                                 |
| --------------------------- | ----------------------------------------------------------------------------------------------------------- |
| **Deadlock**                | Occurs when threads hold some locks and wait for others held by peers.                                      |
| **Circular Wait**           | Condition where T1 waits for T2’s resource and vice versa.                                                  |
| **Fix**                     | Impose a **consistent lock ordering** (e.g., always lock `A` before `B`).                                   |
| **Other Avoidance Methods** | Timeout locks (`pthread_mutex_timedlock`), try-locks (`pthread_mutex_trylock`), or a global lock hierarchy. |





| **Code You Shared**                                                   | **Question No.** | **Title**                                            |
| --------------------------------------------------------------------- | ---------------- | ---------------------------------------------------- |
| **Producer–Consumer (Bounded Buffer with Mutex + Cond)**              | **Q1**           | Producer–Consumer (Bounded Buffer with Mutex + Cond) |
| **Thread-Safe Logger (multiple threads writing to one file safely)**  | **Q2**           | Thread-Safe Logger                                   |
| **Thread Pool (Fixed Size) + Task Queue**                             | **Q3**           | Thread Pool (Fixed Size) + Task Queue                |
| **Deadlock Demo & Fix (two mutexes, opposite order vs. fixed order)** | **Q7**           | Deadlock Demo & Fix                                  |




'