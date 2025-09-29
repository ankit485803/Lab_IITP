


:'

25th Sep 2025 (Thursday)

PS C:\Users\sanja> docker
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







For more help on how to use Docker, head to https://docs.docker.com/go/guides/
PS C:\Users\sanja> docker --version
Docker version 28.4.0, build d8eb465
PS C:\Users\sanja>





29th Sep 2025 (Monday - 7th Puja Navrtri) 
i want to change my docker pull IMAGE from c drive to D 

default setting i cause the storage full ok pls suggest 
 D:\LearnDocker\newFolder\DockerDesktopWSL
 

is this effort my system or not to run any other project if i will work in future bhai, beacue docker image is small size but I run the image and export the completed container that is very big, that why i want to do this

Q. when i pull any images from the docker hub to dokcer images though MNT WSL Linux terminal where that store in my laptop
Jab tu Docker Desktop (Windows + WSL2 backend) use karta hai aur Docker Hub se docker pull chalata hai (chahe PowerShell se ya WSL Linux terminal se), images hamesha ek hi jagah store hoti hain → Docker Desktop ka disk image file.
Ye ek virtual disk file hai (ext4.vhdx) jisme:

Images
Containers
Volumes
Networks
sab kuch ek single Linux filesystem ke tarah store hota ha

Ans: but Ankit ke case mai nahi hoga hm change kar diye hai path to D drive mai sara chale jayega















'