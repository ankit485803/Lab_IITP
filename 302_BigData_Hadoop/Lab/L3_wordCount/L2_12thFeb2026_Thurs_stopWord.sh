

# step1: start hadoop and give permission chmod
!chmod +x mapper.py reducer.py


# step2: put file in hadoop env
%%bash
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export HADOOP_HOME=/content/hadoop-3.3.6
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
hdfs dfs -put -f words.txt /word_count/



%%bash
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export HADOOP_HOME=/content/hadoop-3.3.6
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
hdfs dfs -rm -r /word_count/output
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-input /word_count/words.txt \
-output /word_count/output \
-mapper mapper.py \
-reducer reducer.py \
-file mapper.py \
-file reducer.py


# lastStep: see the output
%%bash
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export HADOOP_HOME=/content/hadoop-3.3.6
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
hdfs dfs -cat /word_count/output/part-00000



;'


12th Feb 2026 (Thursday)


today lab class on twoPart: on goolge colab and locally Hadoop software coding

Stopwords in NLP are high-frequency, low-semantic-value words (e.g., "the," "is," "and") commonly filtered out during text pre-processing to reduce noise, improve model efficiency, and focus on meaningful content. 
They are crucial for tasks like topic modeling or search,
 but should be kept for tasks like translation or sentiment analysis. Common lists are available in NLTK, spaCy, and Spark NLP.



'