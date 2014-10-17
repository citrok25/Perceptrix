<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%-- 
    Document   : root
    Created on : Nov 3, 2013, 1:43:15 AM
    Author     : kayG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <html:form action="rootaction.do" method="post">
            <!-- add form-->
            qno:  <html:text property="qno" ></html:text><br>
            (after field name) qno: <html:text property="after" ></html:text><br>
            option1: <html:text property="option1"></html:text><br>
            option2: <html:text property="option2"></html:text><br>
            option3: <html:text property="option3"></html:text><br>
            option4: <html:text property="option4"></html:text><br>
            correct answer's index: <html:text property="answer"></html:text><br>
            image_url: <html:text property="image_url"></html:text><br>
            question text: <html:text property="question_text"></html:text><br>
            <html:submit value="add"></html:submit>
            
            
        </html:form>
        <hr>
        <html:form action="rootaction.do" method="post">
            <!-- delete form-->
            <html:hidden property="delete" value="1"></html:hidden>
            qno: <html:text property="qno" ></html:text>
            <html:submit value="delete"></html:submit>
        </html:form>
        <hr>
        result: ${requestScope.result}
        
    </body>
</html>
