


:'

i start learning the Docker completer in my college IITP cloud computing couserswork and creating the repo : C:\Users\sanja\Desktop\GitProj\Lab_IITP\311_CloudComputing\dockerTutorialBegineer\oneShot_ByApnaCollege.sh

i am beginner and start first time this, as i faced the earlier codes sharing issues while working on project ResearchKart      and Dcployrncnl & 1-csting: Deploying the platform and ensuring performance. scalability. and 
 using Hostinger. ( Deployed link: https://researchkart.in/




Q2. Docker i am asking to you file extension name: So, when you create the file, you just name it Dockerfile (without .txt, .sh, or any other extension). 
It should be in the root of your project directory (or wherever you are building the Docker image). No need to add an extension because Docker automatically recognizes it by name.



Q3. repo setup for docker

ok thanks

I want to set up this subfolder in the same GitHub repo C:\Users\sanja\Desktop\GitProj\Lab_IITP\311_CloudComputing\dockerTutorialBegineer
and also a separate branch for that, where I can push all the commits related to Docker learn exploring skills

Note: Be alert - this should not merge with my other rest branch, and push all learning skills in this docker-journey-devops branch only. and lastly merge with the main branch

This is below for your reference: my current working status
PS C:\Users\sanja\Desktop\GitProj\Lab_IITP> git branch           
* learn-os-linux
  main
PS C:\Users\sanja\Desktop\GitProj\Lab_IITP> git remote -v        
origin  https://ankit485803@github.com/ankit485803/Lab_IITP.git (fetch)
origin  https://ankit485803@github.com/ankit485803/Lab_IITP.git (push)
PS C:\Users\sanja\Desktop\GitProj\Lab_IITP> git config user.email
ankit485803@gmail.com
PS C:\Users\sanja\Desktop\GitProj\Lab_IITP> git config user.name 
Ankit Kumar
PS C:\Users\sanja\Desktop\GitProj\Lab_IITP>  


Ans: git checkout -b docker-journey-devops
      git add 311_CloudComputing    yah ya  git add 311_CloudComputing/dockerTutorialBegin  sirf yahi folder hoga push ok ankit bhai
      git commit -m "Add dockerTutorialBegineer setup for Docker learning and create a separate branch for Docker and tag this also"
       git tag -a v1.0-docker-start -m "Start Docker journey with initial setup and learning files"
       git push origin docker-journey-devops
      git push origin v1.0-docker-start

      # Final Merge with Main (Later)
     git checkout main
      git pull origin main
      git merge docker-journey-devops
      git push origin main
      




Q4. How to Keep Only Docker Folder in This Branch (Optional)
If you want this branch to show only your Docker tutorial folder (clean and isolated), you can remove other folders just in this branch:

# Make sure you're on docker-journey-devops
git checkout docker-journey-devops

# Remove all other folders except 311_CloudComputing
git rm -r 202_DBMS 208_WebAppDev 301_CNS 303_OS SketchUp_Ruby

# Commit the cleanup
git commit -m "Keep only Docker learning folder in docker-journey-devops branch"

# Push changes
git push


Q6. Delete the Old Branch (Locally + Remote)
git branch -D docker-journey-devops       # delete locally
git push origin --delete docker-journey-devops   # delete on GitHub





'