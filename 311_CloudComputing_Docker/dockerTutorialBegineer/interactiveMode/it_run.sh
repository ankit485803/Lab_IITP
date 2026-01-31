

docker run -it ubuntu


sanja@IITP:~$ docker run -it ubuntu:rolling
root@4a3e1f58d1f1:/# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@4a3e1f58d1f1:/#
root@4a3e1f58d1f1:/# ls
root@4a3e1f58d1f1:/# exit


docker start CONT_ID
docker stop CONT_ID
docker logs 48a24bc25ede  yah id hai hello world container ki jo without it mode run huwa hai interactive mode




:'



30th Sep 2025 (Tuesday - 8th day Navraratri Puja Maa Durga)



⚙️ Why the Behavior is Different
| Feature                     | WSL/Linux Terminal        | Windows PowerShell Terminal |
| --------------------------- | ------------------------- | --------------------------- |
| **Default `ping` count**    | Infinite (until `Ctrl+C`) | 4 packets only              |
| **Duplicates shown?**       | ✅ Yes (via `(DUP!)`)      | ❌ No (Windows doesn't show) |
| **Packet size**             | 56 bytes (+28 bytes ICMP) | 32 bytes total              |
| **Customizable with flags** | `ping -c 4 google.com`    | `ping -n 10 google.com`     |




Q. why this hello world container not run, but previoally i run ubuntu

sanja@IITP:~$ docker ps -a
CONTAINER ID   IMAGE            COMMAND       CREATED          STATUS                        PORTS     NAMES
4a3e1f58d1f1   ubuntu:rolling   "/bin/bash"   28 minutes ago   Exited (137) 26 seconds ago             musing_kepler
48a24bc25ede   hello-world      "/hello"      21 hours ago     Exited (0) 3 minutes ago                vibrant_mayer
sanja@IITP:~$ docker start 48a24bc25ede
48a24bc25ede
sanja@IITP:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
sanja@IITP:~$

Ans: 🔍 The Key Difference
You're comparing two containers:
✅ Ubuntu container (ubuntu:rolling)
        You ran it with /bin/bash — an interactive shell.
        It stays running as long as the shell is open.

✅ Hello World container (hello-world)
    This container runs a very short program that prints a message and exits.
    It is  designed to stop immediately after showing the message.


This runs the container again.Since hello-world has no long-running process, it runs and exits immediately. Thats why it disappears from docker ps (which shows only running containers).
Output is empty — because hello-world exited again immediately after starting.




Q2. delete the container first then img 

Q3. Assign the custom Container NAME while exporting
docker run --name <your_custom_name> <image_name>
docker run -it --name kittu_ubuntu ubuntu:rolling

-it for interactive terminal.
--name kittu_ubuntu gives your container a custom, readable name.
ubuntu:rolling is the image you're running.


Q3. 




'