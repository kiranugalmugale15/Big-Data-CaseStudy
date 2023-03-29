import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Properties;

import com.github.javafaker.Faker;
import com.google.gson.Gson;

class EcommerceData2 {

	String userID;

	String location;

	String sessionId;

	String url;

	String item;

	String action;

	String logTime;

	String payment_method;

	String logDate;

	public EcommerceData2() {

		try(FileReader reader = new FileReader("/home/kiran/Downloads/demo/TestProject/conf")){
			Properties properties = new Properties();
			properties.load(reader);
			
			final String[] PAY_METHODS = properties.getProperty("paymethods").split(",");
			final String[] ACTION_URL =  properties.getProperty("actionurl").split(",");
			final String DOMAIN =  properties.getProperty("domain");
			
			Faker faker = new Faker();
			userID = faker.name().fullName();
			location = faker.address().city();
			sessionId = "s" + faker.idNumber();

			action = ACTION_URL[(int) Math.floor(Math.random() * ACTION_URL.length)];
			item = faker.app().name();

			url = DOMAIN + action + "/item=" + item;

			SimpleDateFormat logTimeFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			logTime = logTimeFormat.format(faker.date().birthday());

			if (action == "placeOrder") {
				payment_method = PAY_METHODS[(int) Math.floor(Math.random() * PAY_METHODS.length)];
			} else {
				payment_method = "";
			}

			SimpleDateFormat logDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			logDate = logDateFormat.format(faker.date().birthday());
		}
		catch(Exception e)
		{
	            e.printStackTrace();
		    System.exit(0);
			
		}
	}

	@Override
	public String toString() {
		return userID + ", " + location + ", " + sessionId + ", " + url + ", " + logTime + ", " + payment_method + ", "
				+ logDate;
	}

}

public class GeneratorEcommerceData {

	public static void main(String[] args) throws FileNotFoundException {
		PrintWriter writer = new PrintWriter(args[1]);
		Gson gson = new Gson();
		System.err.println("Started With Record Generation");
		for (int i = 0; i < Integer.parseInt(args[0]); i++) {
			EcommerceData2 ecommerceData = new EcommerceData2();
			writer.println(gson.toJson(ecommerceData));
		}

		System.err.println("Ended With Record Generation");
		writer.close();
	}

}
