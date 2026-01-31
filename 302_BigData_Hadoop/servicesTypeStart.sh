

## starting services
hdfs namenode -format
start-all.cmd
set PATH=D:\IITP_Lab_Software\302_bigData\jdk8\Installation\bin;%PATH%    #seeAllRunningServices

http://localhost:8088/cluster  #UI of fileSystem
http://localhost:9870/dfshealth.html#tab-overview
http://localhost:9864/datanode.html

hdfs dfs -mkdir /meherData
echo "BigDataAnalytics302 firstClass by Shashank Rawat bhaiya using Hadoop" > manab.text
hdfs dfs -put manab.text /meherData   #seeFileCreated
hdfs dfs -ls /meherData

hdfs dfs -get /meherData/manab.text D:\HadoopFiles\   #apko dowlaod karna parega HDFS se d drive mai and beAlert ankit run mkdir command in d drive okk bhai
stop-all


# Start NameNode
start-dfs.cmd

# Start DataNode, It starts automatically with start-dfs.cmd, but if not, run:
hdfs --daemon start datanode

# Start YARN
start-yarn.cmd




# 📌 Verify Hadoop is Running, Check NameNode Web UI -> Open browser:
http://localhost:9870

# Check DataNode Web UI:
http://localhost:9864


## 📌 Check Hadoop Status via CMD
# NameNode status: 
hdfs dfsadmin -report

# facingIssue
start-dfs.cmd
hadoop/logs




