
founder of POSIX (Portable OS Interface) thread PThread : https://en.wikipedia.org/wiki/Pthreads
https://www.cs.cmu.edu/afs/cs/academic/class/15492-f07/www/pthreads.html
portable operating system interface (posix) thread - PThread official documentation   https://pubs.opengroup.org/onlinepubs/7908799/xsh/pthread.h.html
openGroup_Founder of Pthread pkg  https://www.opengroup.org/recruitment

https://github.com/GerHobbelt/pthread-win32






#include <pthread.h>

int pthread_create(pthread_t *thread, const pthread_attr_t *attr,
                   void *(*start_routine)(void *), void *arg);



:'

16th Oct 2025 (Thursday - Near Diwali and my ISRO ICRB paper before Chhath Puja) Lab5 session  


POSIX threads, commonly known as Pthreads, are a set of threads programming APIs defined by the POSIX (Portable Operating System Interface) standard. 
Pthreads are widely used for writing concurrent programs in Unix-like operating systems, including Linux, macOS, and others. 
They allow developers to create, manage, and synchronize multiple threads within a single process, making them a fundamental tool for
 achieving parallelism in system-level programming.



POSIX Threads is an API defined by the Institute of Electrical and Electronics Engineers (IEEE) standard POSIX.1c, Threads extensions (IEEE Std 1003.1c-1995).



This standard is maintained and published by The Open Group and IEEE. It defines the functions, data structures, and behaviors required for implementing threads in a POSIX-compliant operating system.
The Pthreads API (POSIX Threads) is defined as part of two standards: The Open Group Base Specifications Issue 7, and IEEE Std 1003.1. This means that if a system complies with these standards, it must provide the Pthreads API.






'


sudo apt update
sudo apt install gcc
apt list
sudo apt install libc6-dev
# to check version
lsb_release -a   
uname -r
cat /etc/os-release

which gcc
gcc --version


# current file size 1.9 GB WSL C:\Users\sanja\AppData\Local\wsl  before install gcc 
# after install = 2.23 GB  our folder sizes


sanja@IITP:~$ sudo apt install libc6-dev
sudo: unable to resolve host IITP: Temporary failure in name resolution
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
libc6-dev is already the newest version (2.39-0ubuntu8.6).
libc6-dev set to manually installed.
0 upgraded, 0 newly installed, 0 to remove and 50 not upgraded.
sanja@IITP:~$


gcc -o q2_SumArr q2_SumArr.c -pthread
