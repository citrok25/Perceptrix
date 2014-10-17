package com.google.plus.samples.photohunt.custom;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
 
public class NetClientGet {
 
	// http://localhost:8080/RESTfulExample/json/product/get
	public static String makeRequest(String access_token) {
		String output="";
		String output2="";
	  try {
 
		URL url = new URL("https://www.googleapis.com/oauth2/v2/userinfo");
		
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("Authorization", "Bearer "+access_token);
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");
 
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}
 
		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));
 
		
		System.out.println("REST call made. Output from Server .... \n");
		while ((output = br.readLine()) != null) {
			System.out.println(output);
			output2+=output;
		}
 
		
		System.out.println(output2);
		conn.disconnect();
		
		
 
	  } catch (MalformedURLException e) {
 
		e.printStackTrace();
 
	  } catch (IOException e) {
 
		e.printStackTrace();
 
	  }
	  //return output.substring(output.indexOf("email\": \"")+9, output.lastIndexOf("\","));
	  return trimEmail(output2);
	}

	
	public static String trimEmail(String json_format){
        System.out.println("in trimEmail");
		return json_format.substring(json_format.indexOf("email\": \"")+9, json_format.lastIndexOf("\","));
    }
}