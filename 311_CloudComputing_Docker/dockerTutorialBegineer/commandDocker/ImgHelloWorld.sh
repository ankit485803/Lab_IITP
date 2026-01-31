
sanja@IITP:~$ docker
Usage:  docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Common Commands:
  run         Create and run a new container from an image
  exec        Execute a command in a running container
  ps          List containers
  build       Build an image from a Dockerfile
  bake        Build from a file
  pull        Download an image from a registry
  push        Upload an image to a registry
  images      List images
  login       Authenticate to a registry
  logout      Log out from a registry
  search      Search Docker Hub for images
  version     Show the Docker version information
  info        Display system-wide information

Management Commands:
  ai*         Docker AI Agent - Ask Gordon
  builder     Manage builds
  buildx*     Docker Buildx
  cloud*      Docker Cloud
  compose*    Docker Compose


For more help on how to use Docker, head to https://docs.docker.com/go/guides/
sanja@IITP:~$ docker --version
Docker version 28.4.0, build d8eb465
sanja@IITP:~$ docker images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE



sanja@IITP:~$ docker pull hello-world
Using default tag: latest
latest: Pulling from library/hello-world
17eec7bbc9d7: Pull complete
Digest: sha256:54e66cc1dd1fcb1c3c58bd8017914dbed8701e2d8c74d9262e26bd9cc1642d31
Status: Downloaded newer image for hello-world:latest
docker.io/library/hello-world:latest


sanja@IITP:~$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
hello-world   latest    54e66cc1dd1f   6 weeks ago   20.3kB
sanja@IITP:~$






:'


Hello world is the official first start learn Docker and practice the docker command my first command Ankit bhai

baad mai hm multiple docker img ka eg lenge like Ubuntu, MySQL, MongoDB

https://hub.docker.com/_/hello-world



Q1. now bhai hm docker Hello image download kar liye hai aabh, ese Container banaye, every image ke ek unique id hoga
Ans: docker run IMAGE_NAME

Q2. fir run & execute ho jata hai imgae and ek container ban jata hai and docker randomally name deta hai and unique id 
greeen icon represent yah koi img se container bana hai



Q3. run the https://hub.docker.com/_/ubuntu
The rolling tag is a special Ubuntu tag that always points to the latest non-LTS (standard release) version of Ubuntu.
docker pull ubuntu:rolling





'


sanja@IITP:~$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
hello-world   latest    54e66cc1dd1f   6 weeks ago   20.3kB
sanja@IITP:~$ docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

sanja@IITP:~$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
hello-world   latest    54e66cc1dd1f   6 weeks ago   20.3kB
sanja@IITP:~$ docker container
Usage:  docker container COMMAND

Manage containers

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  exec        Execute a command in a running container
  export      Export a container's filesystem as a tar archive
  inspect     Display detailed information on one or more containers
  kill        Kill one or more running containers
  logs        Fetch the logs of a container
  ls          List containers
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  prune       Remove all stopped containers
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  run         Create and run a new container from an image
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker container COMMAND --help' for more information on a command.
sanja@IITP:~$