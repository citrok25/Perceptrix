/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.perceptrix.customtag;
import java.sql.ResultSet;
/**
 *
 * @author kayG
 */
public class GetString {
    public static String getString(ResultSet rs, String field){
        String result=null;
        try {
            result =  rs.getString(field);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
