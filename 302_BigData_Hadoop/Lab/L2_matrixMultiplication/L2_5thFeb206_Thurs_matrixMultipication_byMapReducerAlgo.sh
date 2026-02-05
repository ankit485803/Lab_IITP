

:'



5th Feb 2026 (Thursday)


matrixMultipication_byMapReducerAlgo



'


# after creating 3 files: matrix.txt, mapper.py and reducer.py


# first command
!chmod +x mapper.py reducer.py


# second 
hdfs dfs -mkdir -p /matrix
hdfs dfs -put -f matrix.txt /matrix


# thirdCommand
hadoop jar %HADOOP_HOME%\share\hadoop\tools\lib\hadoop-streaming-3.3.6.jar -files "mapper.py,reducer.py" -input /matrix/matrix.txt -output /matrix/output -mapper "python mapper.py" -reducer "python reducer.py"


# for seeing the output folder

