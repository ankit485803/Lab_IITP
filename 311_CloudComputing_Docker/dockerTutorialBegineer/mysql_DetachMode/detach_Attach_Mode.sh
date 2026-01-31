

sanja@IITP:~$ docker run -d -e MYSQL_ROOT_PASSWORD=my-secret mysql
docker run -d -e MYSQL_ROOT_PASSWORD=my-secret --name kittuDetachSQL mysql:8.4.6



:'

7th Oct 2025 (Tuesday) Detach and Attach mode to run the container

by default the container run hota hai Attach mode mai, we can change to DETACH so the run in background 



-d
Detached mode — runs the container in the background.

-e MYSQL_ROOT_PASSWORD=my-secret
Sets an environment variable in the container.
Here, you are telling MySQL to use "my-secret" as the root password.


Q. diff b/w Attach Mode vs. Detach Mode in Docker

 Mode                     | Attach Mode                                               | Detach Mode                                                 |
| ------------------------ | --------------------------------------------------------- | ----------------------------------------------------------- |
| **Flag**                 | *(default)* or `--attach`                                 | `-d` or `--detach`                                          |
| **Terminal behavior**    | Your terminal stays connected to the container’s process. | Your terminal is freed; container runs in the background.   |
| **Use case**             | Debugging, interactive sessions, seeing logs live.        | Running background services (e.g., web servers, databases). |
| **Exits when you press** | `Ctrl + C` (stops the container)                          | `Ctrl + C` only stops the CLI, container keeps running.     |
| **Reconnectable?**       | Not easily. You’d need to restart with `-it`.             | Yes, using `docker attach <container>` or `docker logs`.    |






'