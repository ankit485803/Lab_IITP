

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




Q. not completly
WSL runs on virtualization concepts
WSL is not a full VM, but it runs Linux in a lightweight virtualized environment.
Every package you install via apt stays inside WSL.
It does not “spill over” into Windows programs, except that files in /mnt/c/... are shared between Linux and Windows.




'


sudo apt  install gedit

# how to run chat_server.c
gcc chat_server.c -o server
./server

gcc chat_client.c -o client
./client




sudo apt update
sudo apt install xdg-utils

sanja@IITP:/mnt/c/Users/sanja/Desktop/Lab/CNS/Server$ open network_ImgSever.jpeg
sudo apt autoremove
sudo apt clean

# Check your disk usage:
df -h

| Filesystem                      | Size         | Used             | Avail                                                  | Mounted on              | Notes                                                                                    |
| ------------------------------- | ------------ | ---------------- | ------------------------------------------------------ | ----------------------- | ---------------------------------------------------------------------------------------- |
| `/dev/sdd`                      | 1007G        | 2.5G             | 954G                                                   | `/`                     | This is your main Linux root filesystem in WSL. Only 2.5 GB used → plenty of free space. |
| `C:\`                           | 367G         | 172G             | 196G                                                   | `/mnt/c`                | Your Windows C: drive. Almost half used.                                                 |
| `D:\`                           | 33G          | 5.3G             | 28G                                                    | `/mnt/d`                | Windows D: drive.                                                                        |
| `E:\`                           | 57G          | 637M             | 57G                                                    | `/mnt/e`                | Windows E: drive.                                                                        |
| Other `none` and `tmpfs` mounts | 2.0G or 392M | very little used | Mostly temporary system memory and WSL internal mounts | Safe, no action needed. |                                                                                          |



checking disk uses
sudo du -ah / | sort -rh | head -20

#  List all installed packages
dpkg -l
# List manually installed packages only
apt-mark showmanual


# Command	What it does, yaha APT = APT stands for Advanced Package Tool. t’s a command-line tool used to install, update, remove, and manage software packages on Debian-based Linux distributions (like Ubuntu).
sudo apt update	Updates the package database (lists of available packages and versions)