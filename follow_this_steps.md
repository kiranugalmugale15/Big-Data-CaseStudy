## to run zeppelin demo services
bash -x Desktop/cronJob/startZeppelinDemo/startZeppelinDemo.sh

## to stop zeppelin demo services
bash -x Desktop/cronJob/stopZeppelinDemo/stopZeppelinDemo.sh

## to run cronJob Shell script
bash -x Desktop/cronJob/schedule_analysis_script.sh 


# Step 1: Create Java Program To Generate JSON Data
i have created [<b>"Generate_Ecommerce_JsonData_Proj"</b>](https://github.com/kiranugalmugale15/Big-Data-CaseStudy/tree/main/Generate_Ecommerce_JsonData_Proj) java maven project

it is generating data using [<b>"GeneratorEcommerceData"</b>](https://github.com/kiranugalmugale15/Big-Data-CaseStudy/blob/main/Generate_Ecommerce_JsonData_Proj/src/main/java/GeneratorEcommerceData.java) class 

which is using external jar dependancy added in [<b>"pom.xml"</b>](https://github.com/kiranugalmugale15/Big-Data-CaseStudy/blob/main/Generate_Ecommerce_JsonData_Proj/pom.xml)
1. <b>"Javafaker"</b> class to generate random names,address,city,app name for me
2. <b>"Gson"</b> for converting my ecommerce object data into json

also i have created jar [<b>"TestProject-0.0.1-SNAPSHOT-jar-with-dependencies.jar"</b>](https://github.com/kiranugalmugale15/Big-Data-CaseStudy/tree/main/Generate_Ecommerce_JsonData_Proj/target)

# Step 2: Create Map-Reduce Java Program To Count No. Of User
i have created [<b>"UserCount_MapReduce_Proj"</b>]([https://github.com/kiranugalmugale15/Big-Data-CaseStudy/tree/main/Generate_Ecommerce_JsonData_Proj](https://github.com/kiranugalmugale15/Big-Data-CaseStudy/tree/main/UserCount_MapReduce_Proj)) simple java project

which has three class 
1. [<b>"RecordCountDriver.java"</b>](https://github.com/kiranugalmugale15/Big-Data-CaseStudy/blob/main/UserCount_MapReduce_Proj/RecordCountDriver.java) Responsible for running mapreduce program
2. [<b>"RecordCountMapper.java"</b>](https://github.com/kiranugalmugale15/Big-Data-CaseStudy/blob/main/UserCount_MapReduce_Proj/RecordCountMapper.java) Mapping Each Record in key value pair
3. [<b>"RecordCountReducer.java"</b>](https://github.com/kiranugalmugale15/Big-Data-CaseStudy/blob/main/UserCount_MapReduce_Proj/RecordCountReducer.java) Reducing records by adding values

also i have created jar [<b>"activeUserCountMR.jar"</b>](https://github.com/kiranugalmugale15/Big-Data-CaseStudy/tree/main/UserCount_MapReduce_Proj)
