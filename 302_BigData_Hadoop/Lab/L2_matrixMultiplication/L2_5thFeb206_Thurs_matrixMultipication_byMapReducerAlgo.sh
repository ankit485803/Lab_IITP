set PATH=D:\IITP_Lab_Software\302_bigData\jdk8\Installation\bin;%PATH% 


:'



5th Feb 2026 (Thursday)


matrixMultipication_byMapReducerAlgo

Why MapReduce?
        Large matrices cannot fit into memory.
        MapReduce distributes computation across nodes.
        Mapper emits partial products.
        Reducer aggregates them to produce final values.



this



'


# after creating 3 files: matrix.txt, mapper.py and reducer.py
set PATH=D:\IITP_Lab_Software\302_bigData\jdk8\Installation\bin;%PATH% 

# first command
!chmod +x mapper.py reducer.py


# second 
hdfs dfs -mkdir -p /matrix
hdfs dfs -put -f matrix.txt /matrix


# thirdCommand
hadoop jar %HADOOP_HOME%\share\hadoop\tools\lib\hadoop-streaming-3.3.6.jar -files "mapper.py,reducer.py" -input /matrix/matrix.txt -output /matrix/output -mapper "python mapper.py" -reducer "python reducer.py"


# for seeing the output folder

