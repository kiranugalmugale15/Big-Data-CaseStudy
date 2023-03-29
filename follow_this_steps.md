## to run zeppelin demo services
bash -x Desktop/cronJob/startZeppelinDemo/startZeppelinDemo.sh

## to stop zeppelin demo services
bash -x Desktop/cronJob/stopZeppelinDemo/stopZeppelinDemo.sh

## to run cronJob Shell script
bash -x Desktop/cronJob/schedule_analysis_script.sh 


# Step 1:
i have created <b>"Generate_Ecommerce_JsonData_Proj"</b> java maven project

it is generating data using "GeneratorEcommerceData" class ( located at - "/Generate_Ecommerce_JsonData_Proj/src/main/java/GeneratorEcommerceData.java" ) 
which is using 
1. "Javafaker" class to generate random names,address,city,app name for me
2. "Gson" for converting my ecommerce object data into json

also i have created jar which is located at "/Generate_Ecommerce_JsonData_Proj/target/"
