

## starting services
hdfs namenode -format
start-all.cmd
set PATH=D:\IITP_Lab_Software\302_bigData\jdk8\Installation\bin;%PATH%    #seeAllRunningServices





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




