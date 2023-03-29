# this script is trying to run hiveserver 
# so zeeplin can connect to hiveserver and perform analysis on hive tables
# as i am using ubantu 
# i have not set my HIVE_HOME in .bashrc file 
# so "/home/kiran/apache-hive-3.1.2-bin" i am providing full path of hive folder
set -e
/home/kiran/apache-hive-3.1.2-bin/bin/hiveserver2
