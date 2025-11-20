

docker history <image_name>


:'

7th Oct 2025 (Tuesday) Layer



Docker Image Layer - is Immutable nature matlab jisko aap change nahi kar sakte hai, Read-only, Shared across images
Layer Cacheable (CACHING): Docker caches layers to avoid rebuilding unchanged instructions.



🧠 Best Practices for Layer Optimization
| Tip                                  | Why                                                                                        |
| ------------------------------------ | ------------------------------------------------------------------------------------------ |
| Minimize the number of layers        | Each layer increases complexity and size.                                                  |
| Combine `RUN` commands using `&&`    | Reduces the number of layers. Example:<br>`RUN apt-get update && apt-get install -y nginx` |
| Add less-changing instructions early | Helps Docker cache early layers efficiently.                                               |
| Use `.dockerignore`                  | Prevents unnecessary files from being copied into layers.                                  |
| Clean up after install               | Avoids bloated layers. Example:<br>`RUN apt-get clean && rm -rf /var/lib/apt/lists/*`      |


 
📂 Where Are Layers Stored? 
/var/lib/docker/

✅ 2. Does the image take up C drive space? Even though I set Docker to use D drive?
\\wsl$\docker-desktop-data\
C:\Users\<sanj>\AppData\Local\Docker\wsl\data\ext4.vhdx
That .vhdx file grows as you pull images and run containers.






'