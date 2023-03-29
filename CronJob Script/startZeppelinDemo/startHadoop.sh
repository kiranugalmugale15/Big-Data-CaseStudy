#!/bin/bash
# this script is trying to run all deamons of hadoop
# as i am using ubantu 
# i have already set my HADOOP_HOME(Where hadoop is installed) path in .bashrc file
set -e
stop-all.sh
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
hdfs dfsadmin -safemode leave



