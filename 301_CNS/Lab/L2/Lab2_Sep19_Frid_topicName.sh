

sanja@IITP:/mnt/c/Users/sanja/Desktop/Lab/PLB_Sir$ ls
chat_client.c  chat_server.c  ft_client.c  ft_server.c
sanja@IITP:/mnt/c/Users/sanja/Desktop/Lab/PLB_Sir$ gedit chat_server.c
Command 'gedit' not found, but can be installed with:
sudo snap install gedit  # version 48.1, or
sudo apt  install gedit  # version 46.1-3
See 'snap info gedit' for additional versions.




after install 
sanja@IITP:~$ gedit
sanja@IITP:~$ gedit --version
gedit - Version 46.2
sanja@IITP:~$





:'



19th Sep 2025 (Friday)  Lab2



Gedit is a free and easy-to-use text editor for Linux, especially on systems using the GNOME desktop environment (like Ubuntu).
 Its good for both coding and general
 writing because it highlights code syntax, has a simple design, and includes useful features such as a file browser, 
 search/replace, and autosave. You can also add more functions with plugins. Note that Gedit was replaced as
  the default GNOME text editor by a newer application called "GNOME Text Editor" starting with GNOME 42 in 2022. 
  The provided information also mentions a video showing how to install Gedit on Kali Linux.



Cheksum

In GCC (the GNU Compiler Collection), options are distinct commands. The error arises because "-oserver" is interpreted as a single, invalid option. To correctly specify the output file, you need to use "-o server" with a space between "-o" and "server". 
This tells GCC that "-o" is the option to specify the output file, and "server" is the name of the output file you want to create.


Its a compiler — a program that translates human-readable source code (like C, C++, Objective-C, Fortran, etc.) into
 machine code (binary executables) that your computer can run.










'


sudo apt  install gedit

# how to run chat_server.c
gcc chat_server.c -o server
./server

gcc chat_client.c -o client
./client
