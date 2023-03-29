# this script is trying to spark 
# so zeeplin can connect to spark and perform analysis
# as i am using ubantu 
# i have not set my SPARK_HOME in .bashrc file 
# so "/home/kiran/spark-2.4.8-bin-hadoop2.7" i am providing full path of spark folder
set -e
bash /home/kiran/spark-2.4.8-bin-hadoop2.7/sbin/stop-all.sh
bash /home/kiran/spark-2.4.8-bin-hadoop2.7/sbin/start-all.sh	
