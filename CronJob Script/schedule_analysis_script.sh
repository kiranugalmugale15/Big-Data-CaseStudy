#!/bin/bash
# Run Export Block Before Running Main Block Or Stop Executing Script 
{
	
	# This is Export Block
	. /etc/profile
	export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
	export HADOOP_HOME=/home/kiran/hadoop-3.3.3
	export HIVE_HOME=/home/kiran/apache-hive-3.1.2-bin
	export SPARK_HOME=/home/kiran/spark-3.3.1-bin-hadoop3
	export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop
	export PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$HIVE_HOME/bin:$SPARK_HOME/bin:$YARN_CONF_DIR/bin:$PATH

} &&
{
	# This Is Main Block
	
	# Uncomment Below Two Lines If You Want To Maintain Log
	# cat /dev/null > /home/kiran/Desktop/cronJob/logs/test.log
	# exec >/home/kiran/Desktop/cronJob/logs/test.log 2>&1
	
	
	# If Input Generation Jar Is Present Then Execute If Block
	if test -f "/home/kiran/Downloads/demo/TestProject/target/TestProject-0.0.1-SNAPSHOT-jar-with-dependencies.jar" ;
	then
	
		# If Input Generation Jar Is Present Then Execute Jar
		# Pass Argument 
		# Like java -jar pathtoJar/JarName.jar <no_of_records> <output_file_path>
		java -jar /home/kiran/Downloads/demo/TestProject/target/TestProject-0.0.1-SNAPSHOT-jar-with-dependencies.jar 100 /home/kiran/Desktop/cronJob/outputfiles/softwares.txt
		echo "######## JSON DATA STREAM GENERATED JAR RUN SUCCESSFULLY"
		
		
		# If Input File Is Generated 
		if test -f "/home/kiran/Desktop/cronJob/outputfiles/softwares.txt" ;
		then
			echo "######## JSON File Generated At : /home/kiran/Desktop/cronJob/outputfiles/softwares.txt"
		fi
		
	else
	
		# If Input Generation Jar Is Not Present Then Execute Else Block
		echo "######## File does not exist : java -jar /home/kiran/Downloads/demo/TestProject/target/TestProject-0.0.1-SNAPSHOT-jar-with-dependencies.jar"
		exit 1
		
	fi

	# Start Hadoop
	bash /home/kiran/Desktop/cronJob/startZeppelinDemo/startHadoop.sh 
	
	# If Hadoop Started Successfully
	if [ $? -eq 0 ]
	then
	
		  # Append Generated Software.txt JSON file to Hdfs file
		  # Like hdfs dfs -appendToFile local_path/input_file_name.txt hdfs_path/filename_to_which_you_want_to_append.txt
		  echo "######## HADOOP DEAMON SERVICES STARTED"
		  hdfs dfs -appendToFile /home/kiran/Desktop/cronJob/outputfiles/softwares.txt /caseStudyPract/softwares.txt
		  echo "######## UPLOADED JSON FILE 'softwares.txt' at HDFS:://caseStudyPract/softwares.txt"
		  
	else
	
		  # If Hadoop Is Not Started Successfully Then Stop Further Execution
		  echo "######## The script failed : /home/kiran/Desktop/cronJob/startZeppelinDemo/startHadoop.sh" >&2
		  exit 1
		  
	fi

	
	# Remove Old Output Record Present At /mroutput1 which is HDFS folder 
	# And After that run MapReduce Jar
	#Like hadoop jar local_path_to_mapreduce_jar/jar_name.jar driver_class_name hdfs_path/json_inputfile.txt output_hdfs_foler
	hdfs dfs -rm -r /mroutput1 && hadoop jar /home/kiran/Desktop/activeUserCountMR.jar RecordCountDriver /caseStudyPract/softwares.txt /mroutput1

	# If MapReduce Jar Runned Successfully Then Execute If Block
	if [ $? -eq 0 ]
	then
	  echo "######## MAP REDUCE JOB RUN SUCCESSFULLY"
	else
	  echo "######## The command failed : hadoop jar /home/kiran/Desktop/activeUserCountMR.jar" >&2  
	fi

	# I have Created Hive Zeppelin Notebook But You Can Also Create Local .hql file Which You Can Run As Follows
	# hive -f path_to_.hql_file >> path_of_local_.csv_file_where_you_want_to_store_hive_query_output
	hive -f /home/kiran/Desktop/cronJob/HiveJob/activeUserCountHiveQuery.hql >> /home/kiran/Desktop/cronJob/outputfiles/activeUserCountOut.csv
	
	# If Above Command Runned Successfully Then Execute If Block
	if [ $? -eq 0 ]
	then
	  echo "######## HIVE JOB RUN SUCCESSFULLY"
	else
	  echo "######## The command failed : /home/kiran/Desktop/cronJob/HiveJob/activeUserCountHiveQuery.hql" >&2  
	fi

	# I have Created Spark Zeppelin Notebook But You Can Also Create Local .python pyspark file Which You Can Run As Follows
	# spark-submit --master yarn path_to_.py_spark_file
	spark-submit --master yarn /home/kiran/Desktop/cronJob/SparkJob/sparkJob.py
	
	# If Above Command Runned Successfully Then Execute If Block
	if [ $? -eq 0 ]
	then
	  echo "######## SPARK JOB RUN SUCCESSFULLY"
	else
	  echo "######## The command failed : spark-submit --master yarn /home/kiran/Desktop/cronJob/SparkJob/sparkJob.py" >&2  
	fi
}






