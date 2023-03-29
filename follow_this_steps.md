## to run zeppelin demo services
bash -x Desktop/cronJob/startZeppelinDemo/startZeppelinDemo.sh

## to stop zeppelin demo services
bash -x Desktop/cronJob/stopZeppelinDemo/stopZeppelinDemo.sh

## to run cronJob Shell script
bash -x Desktop/cronJob/schedule_analysis_script.sh 


# Step 1:
i have created <b>["Generate_Ecommerce_JsonData_Proj"]([https://www.quora.com](https://github.com/kiranugalmugale15/Big-Data-CaseStudy/tree/main/Generate_Ecommerce_JsonData_Proj))</b> java maven project

it is generating data using <b>"GeneratorEcommerceData"</b> class ( located at - <b>"/Generate_Ecommerce_JsonData_Proj/src/main/java/GeneratorEcommerceData.java"</b> ) 
which is using 
1. <b>"Javafaker"</b> class to generate random names,address,city,app name for me
2. <b>"Gson"</b> for converting my ecommerce object data into json

also i have created jar which is located at <b>"/Generate_Ecommerce_JsonData_Proj/target/"</b>
