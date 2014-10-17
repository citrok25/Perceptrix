package com.perceptrix.databasing;

import DAO.*;
import java.sql.ResultSet;
import com.google.plus.samples.photohunt.model.User;

public class InsertNewUser {
	public boolean insertNewUser(User user) {
		// test if same user exists
		int output=0;
		String query = "select * from user where email_id='" + user.getEmail()
				+ "' and guid='" + user.getGoogleUserId() + "'";
		ResultSet rs = DBService.getData(query);

		
		
		try{
			if (rs.next()) 
				return false; //means user already exists
			
			else{
				//user is not there
				//insert the user
				query="insert into user (guid, email_id, image_url_pro_pic, display_name, google_plus_url) values('"+user.getGoogleUserId()+"','"+user.getEmail()+"','"+user.getGooglePublicProfilePhotoUrl()+"','"+user.getGoogleDisplayName()+"','"+user.getGooglePublicProfileUrl()+"');";
				output = DBService.updateData(query);
			}
		}
		catch(Exception e){
				e.printStackTrace();
		}
		
		if(output==1){
			return true; //new user added
		}
		else	
			return false; //user already exixsts
		

	}
}
