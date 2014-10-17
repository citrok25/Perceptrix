/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.perceptrix.action;

import org.apache.taglibs.standard.tag.common.sql.ResultImpl;
import DAO.*;
import java.sql.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.api.services.plus.model.Person.Organizations;

/**
 * 
 * @author kayG
 */
public class InitiatePlayAction extends org.apache.struts.action.Action {

	/*
	 * forward name="success" path=""
	 */
	private static final String SUCCESS = "success";

	/**
	 * This is the action called from the Struts framework.
	 * 
	 * @param mapping
	 *            The ActionMapping used to select this instance.
	 * @param form
	 *            The optional ActionForm bean for this request.
	 * @param request
	 *            The HTTP Request we are processing.
	 * @param response
	 *            The HTTP Response we are processing.
	 * @throws java.lang.Exception
	 * @return
	 */
	@Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        //if session exists?
            //if session has required values
                //further processing
                    //question numbers to be diaplayed with attempted and unattempted questions marked
                //at end forward to inittiateplaysucess
        
        //else
            //mapping forwars to intiateplayfailure

        
        HttpSession session = request.getSession(false);
        if(session==null){
                return mapping.findForward("initiateplayfailure");
            }
        else if(session!=null && (String)session.getAttribute("email_id")!=null && !(((String)session.getAttribute("email_id")).equals(""))){
            //get who is logged in from session and via databasing get the attempted question
            
            //get the email of logged in user
            String email_id = (String)session.getAttribute("email_id");
            System.out.println(email_id);
            
            System.out.println("query fired: "+"select * from user where email_id='"+email_id+"';");
            //fire db
            
            
            //System.out.println(rs);
//            if(rs.next()){
//                //rs.beforeFirst();
//                request.setAttribute("result_set", rs);
//            }
        
            //DBService.closeConnection();
            //the last line
            
            
            //check if the user has attempted (integral of 3)th question
            String query1="select * from user where email_id='"+email_id+"'";
            ResultSet rs1 = DBService.getData(query1);
            
            //get the total number of questions
            String query2="select count(qno) from admin";
            ResultSet rs2= DBService.getData(query2);
            rs2.next();
            int total_number_of_questions = rs2.getInt("count(qno)");
            session.setAttribute("total_number_of_questions", total_number_of_questions);
            
            int count=0;
            if(rs1.next()){
            	 for(int i=1;i<=total_number_of_questions;i++){
                 	//count the number of q user has answered
                 	if(!(rs1.getString("qno"+i).equals("unatt"))){
                 		count++;
                 	}
                 }
                 
            }
           
            
            //setting number of questions attempted in request so that do not ignore info appears only once
            request.setAttribute("number_of_questions_attempted", ""+count);
            
            
            //converting count to remainder
            count=count%3;
            
            if(count==0){
            	//integral of three
            	
            	//copy result->temp_result
            	query1="update user set temp_result = result where email_id='"+email_id+"'";
            	DBService.updateData(query1);
            	
            	
            	
            	//aid interactive post
            	request.setAttribute("init_interactive_post", "ok");
            	
            }
            
            ResultSet rs = DBService.getData("select * from user where email_id='"+email_id+"';");//where email_id="+email_id);
            if(rs.next()){
                //rs.beforeFirst();
                request.setAttribute("result_set", rs);
            }
            
            
            
            //for toppers list
            query2 = "select * from user order by result desc limit 0,5";
            rs2 = DBService.getData(query2);
            
            request.setAttribute("topper_result_set", rs2);
            
            
            
            
            
            return mapping.findForward("initiateplaysuccess");
        }
        request.setAttribute("no_session_error", "Hey! Please Sign In First.");
        return mapping.findForward("home");
    }
}
