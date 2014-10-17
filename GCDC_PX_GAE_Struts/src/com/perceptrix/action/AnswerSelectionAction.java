/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.perceptrix.action;

import DAO.DBService;
import com.perceptrix.bean.AnswerSelectBean;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author kayG
 */
public class AnswerSelectionAction extends org.apache.struts.action.Action {

    /*
     * forward name="success" path=""
     */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        //get the bean
        AnswerSelectBean asb = (AnswerSelectBean) form;
       
        //get the option 
        String chosen_option = ""+asb.getSelected_option();
        
        //get the question number from session
        HttpSession session = request.getSession(false);
        String current_question_number=(String)session.getAttribute("qno");
        String email_id = (String)session.getAttribute("email_id");
        
        
        //checking if user is not submitting the answer again any same question
        String query2 = "select qno"+current_question_number+" from user where email_id='"+email_id+"'"; 
        System.out.println(query2);
        java.sql.ResultSet rs2 = DBService.getData(query2);
        
        
        if(rs2.next()){
        	System.out.println("rs.getString(): "+rs2.getString("qno"+current_question_number));
        	if(rs2.getString("qno"+current_question_number).equals("0")){ // IFF unattempted, answer the question
        		
        		//if answer is correct. increase the result by ten
                String query="update user set result=(result+10) where email_id='"+email_id+"' and exists (select * from admin where qno="+current_question_number+" and answer='"+chosen_option+"')";
                DBService.updateData(query);
                
                //then store the chosen answer
                query="update user set qno"+current_question_number+"='"+chosen_option+"' where email_id='"+email_id+"'";
                DBService.updateData(query);
                
                //interactive post per three question logic 
                
                
                //return to initiateplay.do
                request.setAttribute("answer_submitted", "Hooray! Your answer for Question "+current_question_number+" is submitted successfully!");
                return mapping.findForward("success");
        	}
        	return mapping.findForward("error");
        }
        else{
        	return mapping.findForward("error");

        }
        
        
    }
}