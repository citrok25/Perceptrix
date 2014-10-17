/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.perceptrix.bean;

import DAO.DBService;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 * 
 * @author kayG
 */
public class QuestionSelectBean extends org.apache.struts.action.ActionForm {

	private String qno;

	public QuestionSelectBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * This is the action called from the Struts framework.
	 * 
	 * @param mapping
	 *            The ActionMapping used to select this instance.
	 * @param request
	 *            The HTTP Request we are processing.
	 * @return
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();

		
		HttpSession session = request.getSession(false);
		String email_id = (String) session.getAttribute("email_id");
		System.out.println(email_id);
		
		// format the qno
		if (getQno() != null) {
			String formatted_qno = "qno" + getQno(); // example: qno2
			System.out.println(formatted_qno);
			// fire db
			System.out.println("select " + formatted_qno + " from user");
			java.sql.ResultSet rs = DBService.getData("select " + formatted_qno
					+ " from user where email_id='"+email_id+"'");

			try {
				System.out.println(rs);
				if (rs != null) {
					System.out.println("not null");
					rs.next();
					System.out.println(rs.getString(formatted_qno));
					if (!(rs.getString(formatted_qno).equals("unatt"))) {
						System.out.println("alreadu attempted");
						errors.add("qno", new ActionMessage(
								"error.alreadyattempted"));
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			// when an already attempted question is clicked
			// request doent go to Play action
			// so in that case for the colouring of the buttons
			

			System.out.println("query fired: "
					+ "select * from user where email_id='" + email_id + "';");
			// fire db
			rs = DBService.getData("select * from user where email_id='"
					+ email_id + "';");// where email_id="+email_id);

			// System.out.println(rs);
			try {
				if (rs.next()) {
					// rs.beforeFirst();
					request.setAttribute("result_set", rs);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		
		  String query2 = "select * from user order by result desc limit 0,5";
          ResultSet rs2 = DBService.getData(query2);
          
          request.setAttribute("topper_result_set", rs2);

		System.out.println("returning from validate() of QSB");
		return errors;

	}

	/**
	 * @return the qno
	 */
	public String getQno() {
		return qno;
	}

	/**
	 * @param qno
	 *            the qno to set
	 */
	public void setQno(String qno) {
		this.qno = qno;
	}
}
