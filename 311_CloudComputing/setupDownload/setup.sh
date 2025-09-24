


:'

24th Sep 2025 (Wednesday - third day Navratri)


download the Docker Desktop AMD 16

On the Docker site, you see two Windows options:
Download for Windows   AMD64 (ankit dell laptop ye hai) and  ARM64



two types of processor used: In simple terms:

*   **AMD (Advanced Micro Devices):** A company that mainly designs processors using the x86 architecture, which is commonly found in desktop and laptop computers.
*   **ARM (Advanced RISC Machines):** A company that designs processors based on the RISC (Reduced Instruction Set Computing) architecture. ARM designs are widely used in mobile devices, embedded systems, and increasingly in laptops and servers due to their energy efficiency.




From the screenshot you provided, your laptop is using an Intel Core i5-1135G7 processor. This is an Intel processor, so it is an AMD64 (x64) architecture, not ARM64.
For Docker Desktop, you should download the version for Windows - AMD64.

dowload in D drive and install also in same

step 1 – Install
Always install Docker Desktop in C: (default, no option to change).

🔹 Step 2 – Change global container/image storage
In Docker Desktop → Settings → Resources → Advanced, you can change the default disk image location to a folder in D:, e.g.:
D:\IITP_Lab_Software\311_CloudCompDocker\data



Step 3 – Per-project storage (optional)
If you want different projects to store their containers/volumes separately on D:, you can:
Use Docker volumes with a custom path:
docker run -v D:\Project1Data:/data myimage
docker run -v D:\Project2Data:/data myimage


Q1. how much that consume the spaces ? ans: 2 GB appraox
Q2. hi 
https://app.docker.com/accounts/ankit127iitp/settings/account-information
how to change the profile photo 

Ans:  signup  https://en.gravatar.com/  and sign up or log in using the email address associated with your Docker account. 
    Upload your profile picture: Once logged into Gravatar, you can upload a new profile picture that will be used across various sites, including Docker.
    and then  Link Gravatar to Docker: In your Docker account settings (as shown in the image you uploaded), under the "Gravatar email" field, ensure you enter the same email address you used for Gravatar.

after created profile https://gravatar.com/ankit127iitp   and   https://hub.docker.com/u/ankit127iitp


Q3. 






'