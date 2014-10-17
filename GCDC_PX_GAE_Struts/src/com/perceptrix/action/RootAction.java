/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.perceptrix.action;

import DAO.DBService;
import com.perceptrix.bean.RootBean;
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
public class RootAction extends org.apache.struts.action.Action {

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
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email_id")==null) {
            return mapping.findForward("error");
        }

        if (session.getAttribute("email_id")!=null &&  !(((String) session.getAttribute("email_id")).equals("pokekrishna@gmail.com"))) {
            return mapping.findForward("error");
        } else {
        	
            RootBean rb = (RootBean) form;

            String qno = rb.getQno();
            if(qno==null) return mapping.getInputForward();
            String query = "";
            //check for detetion
            if (rb.getDelete() == 1) {
                //deletion action


                query = "DELETE FROM admin WHERE qno = " + qno;
                int flag1 = DBService.updateData(query);
                query = "ALTER TABLE user DROP qno" + qno;
                int flag2=0;
                if(flag1 > 0){
                	flag2 = DBService.updateData(query);
                }
                
                if (flag1 > 0 && flag2 > 0) {
                    request.setAttribute("result", "deletion done of qno" + qno);
                }

            } else {
                //insertion
                query = "INSERT INTO admin VALUES (" + qno + ", '" + rb.getOption1() + "', '" + rb.getOption2() + "', '" + rb.getOption3() + "', '" + rb.getOption4() + "', '" + rb.getAnswer() + "', '" + rb.getImage_url() + "', '" + rb.getQuestion_text() + "');";
                int flag1 = DBService.updateData(query);
                
                query="ALTER TABLE user ADD qno"+qno+" VARCHAR( 10 ) NOT NULL DEFAULT 'unatt' AFTER qno"+rb.getAfter()+"";
                int flag2=0;
                if(flag1>0)
                flag2 = DBService.updateData(query);
                
                 if (flag1 > 0 && flag2 > 0) {
                    request.setAttribute("result", "addition done of qno" + qno);
                }

            }


        }


        return mapping.getInputForward();
    }
}
