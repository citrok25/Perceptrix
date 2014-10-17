/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.perceptrix.other;

import DAO.DBService;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.*;
import java.sql.ResultSet;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import org.apache.bsf.util.IOUtils;

/**
 *
 * @author kayG
 */
public class ImageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	
    	java.sql.ResultSet rs  = DAO.DBService.getData("select * from user");
		try{while(rs.next()){
			System.out.println(rs.getString("email_id"));
		}}catch(Exception e){e.printStackTrace();}
    	
    	
    	
    	/*
        response.setContentType("image/jpg");
        //PrintWriter out = response.getWriter();
        try {
            //get the id(random) of requested image
            //get the mapping
            //fire db to get the url
            //use that url in getting the image

            //AT LAST: set that rabdom nuumber to zero

            HttpSession session = request.getSession(false);
            System.out.println("from session: "+(String)session.getAttribute("random_number"));
            System.out.println("from request: "+request.getParameter("id"));
            
                System.out.println(request.getParameter("id"));
                
                if(request.getParameter("id") != null){
                if (!(request.getParameter("id").equals(""))) {
                    System.out.println("not eq to ''");
                    if (request.getParameter("id").equals(((String) session.getAttribute("random_number")))) {
                        
                        //all's ok
                        String query = "select image_url from admin where qno=" + ((String) session.getAttribute("qno"));
                        System.out.println(query);
                        ResultSet rs = DBService.getData(query);
                        if (rs != null && rs.next()) {
                            System.out.println("url retrvd: "+rs.getString("image_url"));
                            
                            URL hp = new URL(rs.getString("image_url"));
                            URLConnection hpCon = hp.openConnection();
                            int len = hpCon.getContentLength();
                            response.setContentLength(len);
                            InputStream bis = hpCon.getInputStream();
//                            byte[] data = new byte[len];
//                            bis.read(data, 0, len);
//                            response.getOutputStream().write(data);
//                            response.getOutputStream().flush();
//                            
//                            BufferedInputStream bis= new BufferedInputStream(hpCon.getInputStream());
//                            BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
//                            byte[] data = new byte[1024*1];
//                            while(bis.read(data)!=-1){
//                                bos.write(data);
//                                //either flush() here
//                                bos.flush();
//                            }
                            
                            //or flush() here
                            
                            
                            
                            
                            BufferedImage bi = ImageIO.read(bis);
                            ImageIO.write(bi, "jpeg", response.getOutputStream());
                            response.getOutputStream().close();
                            response.getOutputStream().flush();
                            bis.close();
//                            bos.close();
                            
                            
                            //Last line
                            session.setAttribute("random_number", "0");

                        }

                    } else {
                        //id != random_number //security breaching
                        response.sendRedirect("error.do");
                    }
                }
            
        }
           else {
                        //id != random_number //security breaching
                        response.sendRedirect("error.do");
                    }     



        } catch (Exception e) {
            e.printStackTrace();
        }
    */}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
