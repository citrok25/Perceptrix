/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package stubs;

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
public class CreateSessionStubAction extends org.apache.struts.action.Action {

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
        //this action is a stub 
        //It creates session
        //and in the end, redirects to home.jsp
        
        HttpSession session =  request.getSession(true);
        session.setAttribute("display_name", "Krishna Gupta");
        session.setAttribute("email_id", "pokekrishna@gmail.com");
        session.setAttribute("guid", "101");
        session.setAttribute("image_url", "imgurl.jpg");
        session.setAttribute("google_plus_url", "http://plus.google.com/101");
        
        
        
        
        
        
        
        return mapping.findForward("home");
    }
}
