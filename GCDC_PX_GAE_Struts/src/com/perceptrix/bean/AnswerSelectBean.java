/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.perceptrix.bean;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author kayG
 */
public class AnswerSelectBean extends org.apache.struts.action.ActionForm {
    
    
    private int selected_option;

    /**
     * @return
     */
   

    /**
     *
     */
    public AnswerSelectBean() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if(getSelected_option()<=0 || getSelected_option()>4){
            errors.add("selected_option", new ActionMessage("error.wrong_option_selected"));
        }
        return errors;
    }

    /**
     * @return the selected_option
     */
    public int getSelected_option() {
        return selected_option;
    }

    /**
     * @param selected_option the selected_option to set
     */
    public void setSelected_option(int selected_option) {
        this.selected_option = selected_option;
    }
}
    