/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.perceptrix.action;

import DAO.DBService;
import com.perceptrix.bean.QuestionSelectBean;
import java.sql.ResultSet;
import java.util.Random;
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
public class Play extends org.apache.struts.action.Action {

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
        
    	
    	
    	
    	System.out.println("in the Play Action");
    	
    	//if user has opened play.do then redirect him to initiateplay.do
        QuestionSelectBean qsb = (QuestionSelectBean) form;
        if (qsb.getQno() == null || qsb.getQno().equals("")) {
            return mapping.findForward("unauthenticated request");
        }

        //getting the logged in user
        HttpSession session = request.getSession(false);
        String email_id = (String) session.getAttribute("email_id");



        //setting the answer as 0 aka none
        //format the qno
        String formatted_qno = "qno" + qsb.getQno(); //example: qno2
        String query = "update user set " + formatted_qno + "='0' where email_id='" + email_id + "' ";
        System.out.println("query fired: " + query);
        DBService.updateData(query);


        //getting the requested qno info
        ResultSet question_result_set = DBService.getData("select * from admin where qno=" + qsb.getQno());
        request.setAttribute("question_result_set", question_result_set);



        //setting the request scope again with ResultSet so that buttons can be coloured
        System.out.println(email_id);

        System.out.println("query fired: " + "select * from user where email_id='" + email_id + "';");
        //fire db
        ResultSet rs = DBService.getData("select * from user where email_id='" + email_id + "';");//where email_id="+email_id);

        //System.out.println(rs);
        if (rs.next()) {
            //rs.beforeFirst();
            request.setAttribute("result_set", rs);
        }

        //setting security in session
        session.setAttribute("qno", qsb.getQno());
        String random_number = "" + randomNumber(session.getLastAccessedTime());

        session.setAttribute("random_number", random_number);


        //set the request with question and its answers
        ResultSet admin_result_set = DBService.getData("select * from admin where qno=" + qsb.getQno());
        admin_result_set.next();
        request.setAttribute("admin_result_set", admin_result_set);



        return mapping.findForward("playsuccess");
    }

    private int randomNumber(long seed) {
        Random r = new Random(seed);
        return (r.nextInt(Integer.MAX_VALUE) + 100);
    }
}
