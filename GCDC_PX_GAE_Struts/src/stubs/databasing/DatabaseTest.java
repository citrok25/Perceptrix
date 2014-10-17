/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stubs.databasing;

import DAO.DBService;
import java.sql.*;

/**
 *
 * @author kayG
 */
public class DatabaseTest {

    public static void main(String[] args) {
        ResultSet rs = DBService.getData("select * from admin where qno=1 and answer='2'");


//        try {
//            while(rs.next()){
//            System.out.println(rs.getString("id"));
//            System.out.println(rs.getString("guid"));
//            System.out.println(rs.getString("email_id"));
//            System.out.println(rs.getString(7));
//            System.out.println(rs.getString("display_name"));
//            
//            
//        }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        finally{
//            //DBService.closeConnection();
//        }
        try {
            
            if (rs.next() == false) {
                //nothing in the response
                System.out.println("nothing in the response");
            } else {
                //something in the response
                System.out.println("something in the response");
            }

        } catch (Exception e) {
        }



        //inserting 

        //done when a new user is added
        //if a guid not in users
        //add (run this query)
        //DBService.updateData("delete from user where id>3");
        //DBService.updateData("insert into user (id, guid, email_id, image_url_pro_pic, display_name, google_plus_url)values(NULL, '101', 'pokekrishna@gmail.com', 'imgurl', 'Krishna Gupta', 'g+url')");













    }
}
