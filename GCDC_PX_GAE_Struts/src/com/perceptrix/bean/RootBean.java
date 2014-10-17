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
public class RootBean extends org.apache.struts.action.ActionForm {

    private String qno;
    private String after;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String answer;
    private String image_url;
    private String question_text;
    private int delete;

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        return null;
    }

    /**
     * @return the qno
     */
    public String getQno() {
        return qno;
    }

    /**
     * @param qno the qno to set
     */
    public void setQno(String qno) {
        this.qno = qno;
    }

    /**
     * @return the after
     */
    public String getAfter() {
        return after;
    }

    /**
     * @param after the after to set
     */
    public void setAfter(String after) {
        this.after = after;
    }

    /**
     * @return the option1
     */
    public String getOption1() {
        return option1;
    }

    /**
     * @param option1 the option1 to set
     */
    public void setOption1(String option1) {
        this.option1 = option1;
    }

    /**
     * @return the option2
     */
    public String getOption2() {
        return option2;
    }

    /**
     * @param option2 the option2 to set
     */
    public void setOption2(String option2) {
        this.option2 = option2;
    }

    /**
     * @return the option3
     */
    public String getOption3() {
        return option3;
    }

    /**
     * @param option3 the option3 to set
     */
    public void setOption3(String option3) {
        this.option3 = option3;
    }

    /**
     * @return the option4
     */
    public String getOption4() {
        return option4;
    }

    /**
     * @param option4 the option4 to set
     */
    public void setOption4(String option4) {
        this.option4 = option4;
    }

    /**
     * @return the answer
     */
    public String getAnswer() {
        return answer;
    }

    /**
     * @param answer the answer to set
     */
    public void setAnswer(String answer) {
        this.answer = answer;
    }

    /**
     * @return the image_url
     */
    public String getImage_url() {
        return image_url;
    }

    /**
     * @param image_url the image_url to set
     */
    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    /**
     * @return the question_text
     */
    public String getQuestion_text() {
        return question_text;
    }

    /**
     * @param question_text the question_text to set
     */
    public void setQuestion_text(String question_text) {
        this.question_text = question_text;
    }

    /**
     * @return the delete
     */
    public int getDelete() {
        return delete;
    }

    /**
     * @param delete the delete to set
     */
    public void setDelete(int delete) {
        this.delete = delete;
    }
}
