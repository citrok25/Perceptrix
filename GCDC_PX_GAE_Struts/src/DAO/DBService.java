/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.sql.*;

import com.google.appengine.api.utils.SystemProperty;

/**
 *
 * @author kayG
 */
public class DBService {
    private static Connection con=null;
    
    static{
        try {
//        	
//
        	String database_url="";
        	String database_username="";
        	String database_password="";
       	
        	
//        	String database_url="jdbc:mysql://sql3.freemysqlhosting.net/sql321738";
//            String database_username="sql321738";
//            String database_password="wG5%dM4*";
        	
        	
//            String database_url="jdbc:mysql://localhost:3306/perceptrixdb";
//            String database_username="root";
//            String database_password="";
//            
//            String database_url="jdbc:mysql://db4free.net:3306/perceptrixdb";
//            String database_username="perceptrixdb";
//            String database_password="$var=pxdb";
		
        	
//        	
        	if (SystemProperty.environment.value() ==
        	          SystemProperty.Environment.Value.Production) {
        	        // Load the class that provides the new "jdbc:google:mysql://" prefix.
        	        Class.forName("com.mysql.jdbc.GoogleDriver");
        	        database_url="jdbc:google:mysql://gcdc2013-perceptrix:perceptrixdb/perceptrixdb";
        	        database_username="root";
        	        database_password="";
        	      } else {
        	        // Local MySQL instance to use during development.
        	        Class.forName("com.mysql.jdbc.Driver");
        	        database_url="jdbc:mysql://localhost:3306/perceptrixdb";
        	        database_username="root";
        	        database_password="";
        	      }

        	
        	
        	
        	 con = DriverManager.getConnection(database_url, database_username, database_password);
        } 
        catch (Exception e) {
            System.out.println("Connection Err!"+e);
        }
    }
    
    public static Connection getConnection(){
        return con;
    }
    
    public static ResultSet getData(String query) {
        Statement st=null;
        ResultSet rs=null;
        try {
            st=con.createStatement();
            rs=st.executeQuery(query);
            return rs;
		
        } catch (Exception e) {
            System.out.println("Select Err!"+e);
            return null;
        }
    }
    
    public static int updateData(String query) {
        Statement st=null;
        int ur;
        try {
            st=con.createStatement();
            ur=st.executeUpdate(query);
            return ur;
		
        } catch (Exception e) {
            System.out.println("Update Err!"+e);
            return 0;
        }
    }
    
    
}
