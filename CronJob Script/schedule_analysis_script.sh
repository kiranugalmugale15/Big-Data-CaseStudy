#!/bin/bash
# redirect stdout/stderr to a file

{
	. /etc/profile
	export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
	export HADOOP_HOME=/home/kiran/hadoop-3.3.3
	export HIVE_HOME=/home/kiran/apache-hive-3.1.2-bin
	export SPARK_HOME=/home/kiran/spark-3.3.1-bin-hadoop3
	export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop
	export PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$HIVE_HOME/bin:$SPARK_HOME/bin:$YARN_CONF_DIR/bin:$PATH

} &&
{
	# cat /dev/null > /home/kiran/Desktop/cronJob/logs/test.log
	# exec >/home/kiran/Desktop/cronJob/logs/test.log 2>&1
	
	if test -f "/home/kiran/Downloads/demo/TestProject/target/TestProject-0.0.1-SNAPSHOT-jar-with-dependencies.jar" ;
	then

		java -jar /home/kiran/Downloads/demo/TestProject/target/TestProject-0.0.1-SNAPSHOT-jar-with-dependencies.jar 100 /home/kiran/Desktop/cronJob/outputfiles/softwares.txt
		echo "######## JSON DATA STREAM GENERATED JAR RUN SUCCESSFULLY"
		
		if test -f "/home/kiran/Desktop/cronJob/outputfiles/softwares.txt" ;
		then
			echo "######## JSON File Generated At : /home/kiran/Desktop/cronJob/outputfiles/softwares.txt"
		fi
	else
		echo "######## File does not exist : java -jar /home/kiran/Downloads/demo/TestProject/target/TestProject-0.0.1-SNAPSHOT-jar-with-dependencies.jar"
		exit 1
	fi


	
	bash /home/kiran/Desktop/cronJob/startZeppelinDemo/startHadoop.sh 
	
	if [ $? -eq 0 ]
	then
	  echo "######## HADOOP DEAMON SERVICES STARTED"
	  hdfs dfs -appendToFile /home/kiran/Desktop/cronJob/outputfiles/softwares.txt /caseStudyPract/softwares.txt
	  echo "######## UPLOADED JSON FILE 'softwares.txt' at HDFS:://caseStudyPract/softwares.txt"
	else
	  echo "######## The script failed : /home/kiran/Desktop/cronJob/startZeppelinDemo/startHadoop.sh" >&2
	  exit 1
	fi

	

	hdfs dfs -rm -r /mroutput1 && hadoop jar /home/kiran/Desktop/activeUserCountMR.jar RecordCountDriver /caseStudyPract/softwares.txt /mroutput1

	if [ $? -eq 0 ]
	then
	  echo "######## MAP REDUCE JOB RUN SUCCESSFULLY"
	else
	  echo "######## The command failed : hadoop jar /home/kiran/Desktop/activeUserCountMR.jar" >&2  
	fi


	hive -f /home/kiran/Desktop/cronJob/HiveJob/activeUserCountHiveQuery.hql >> /home/kiran/Desktop/cronJob/outputfiles/activeUserCountOut.csv
	
	if [ $? -eq 0 ]
	then
	  echo "######## HIVE JOB RUN SUCCESSFULLY"
	else
	  echo "######## The command failed : /home/kiran/Desktop/cronJob/HiveJob/activeUserCountHiveQuery.hql" >&2  
	fi

	spark-submit --master yarn /home/kiran/Desktop/cronJob/SparkJob/sparkJob.py
	
	if [ $? -eq 0 ]
	then
	  echo "######## SPARK JOB RUN SUCCESSFULLY"
	else
	  echo "######## The command failed : spark-submit --master yarn /home/kiran/Desktop/cronJob/SparkJob/sparkJob.py" >&2  
	fi
}






