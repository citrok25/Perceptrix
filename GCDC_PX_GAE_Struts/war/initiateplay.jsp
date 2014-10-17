<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@page import="java.sql.ResultSet" %>
<%@taglib prefix="fn" uri="/WEB-INF/custom_taglib.tld" %>


<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); 

%>

<html lang="en" xmlns:ng="http://angularjs.org">
    <head>
        <meta charset="utf-8">
        <title>Perceptrix</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <style type="text/css">
            body {
                padding-top: 40px;
                padding-bottom: 25px;
            }
        </style>
        <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

        <link rel="shortcut icon" href="pxicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
    
       
       
        <link href="assets/css/bootstrap.css" rel="stylesheet"> 
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap-modal.js"></script>
 
    <script type="text/javascript">
    			function startup(){
    				
    				

    				$('#example').modal({
    					  keyboard: false,
    					   backdrop: 'static'
    					})
    				;
    			}
    				</script>
    
    
    
    </head>

    <body <c:if test="${ (requestScope.number_of_questions_attempted eq '0')}">onload="startup();"</c:if><c:if test="${(requestScope.init_interactive_post eq 'ok' and !(fn:getString(requestScope.result_set, 'temp_result') eq '0'))}"> onload="document.getElementById('myBtn').click();"</c:if> >

     
     <noscript><div class="alert alert-warning"><center><h2>Please enable JavaScript in your browser or you'll not be able to view any question</h2></center></div></noscript>
     
     
     <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container-fluid">
                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>
                        <a class="brand" href="#" ><font size="6" color="red">Percep</font><font size="6" color="white">trix</font></a>
                        <div class="nav-collapse collapse">
                            <p class="navbar-text pull-right">
                                 <!-- picking values from session -->
	
        <span ng-show="userProfile" >
	        <a target="_blank" href="${sessionScope.google_plus_url}">
	          <span class="name" ><font  id="google_name" size="4" color="red">${sessionScope.display_name }</font></span>
	          <img height="32" width="32" src="${sessionScope.image_url }" />
	        </a>
	      
         </span>
                            </p>
                            <ul class="nav">
                                <li><a href="home.do">Home</a></li>
                                <li class="active"><a href="initiateplay.do">Play</a></li>
                                <li ><a href="credits.do">Credits</a></li>
                                <li><a href="help.do">Help</a><li>


                            </ul>
                        </div><!--/.nav-collapse -->
                    </div>
                </div>
            </div>

        <div ><table border="0" width="100%"> <tr> <td align="left"><a target="_blank" href="https://www.facebook.com/united.technophile"><img src="tp.png" width="296" height="80"></a></td><td align="right"><a target="_blank" href="https://sites.google.com/site/gdgallahabad/"><img src="gdg.jpg"  width="296" height="80" align="right"></a></td></tr></table>
    </div>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <div class="quest-unit">
                    <div class="pagination ">
                        <ul class="nav nav-list">
                            <li class="active disabled"><a>Select A Green Question </a></li>
                        </ul>




                        <table >
                        <%
                        	//get the ResultSet
                        	ResultSet rs = (ResultSet) request.getAttribute("result_set");
                        	int total_number_of_questions = (Integer)session.getAttribute("total_number_of_questions");
                        	for(int count=1; count<=total_number_of_questions; count++){
                        		pageContext.setAttribute("count", count);
                        		pageContext.setAttribute("fcount", String.format("%02d", count));
                        		if(count % 4==1) out.print("<tr>");
                        		%><td>
                                    <html:form method="post" action="play.do"><html:hidden property="qno" value="${pageScope.count }"></html:hidden>
                                    <% if(rs.getString("qno"+count).equals("unatt")){
                                    	%><input type="submit" class="btn btn-success" name="questionButton" value="${pageScope.fcount }" /><%
                                    } 
                                    else{
                                    %><input type="submit" class="btn btn-danger" name="quest1" value="${pageScope.fcount }" />
                                    <%} %>
                                        </html:form>
                                    </td>
								<%
                        	if(count % 4==0) out.print("</tr>");
                        	
                        	}
                        %></table>
                        
				<table class="table table-striped">

                                    <thead><tr><th >Top 5 players</th></tr></thead>

							<%ResultSet rs2 = (ResultSet)request.getAttribute("topper_result_set"); 
								while(rs2.next()){
									out.print("<tr><td><a href='"+rs2.getString("google_plus_url")+"' target='_blank'><img height='30' width='30'src="+rs2.getString("image_url_pro_pic")+">"+rs2.getString("display_name")+"("+rs2.getString("email_id").substring(0, rs2.getString("email_id").lastIndexOf('@'))+")"+"</td></tr>");
								}
							%>

						</table>



                        </div>
                    </div>
                </div>



                <div class="span9 offset1">
                    <!--Body content-->
                    <div class="timeimgopt-unit">
                      
                        
                        
                        
                        
                        
                        
                        <div class="row">


                        <table border="0" width="100%">
                            <tr>
                                <td align="left">

                                    <div class="timeimgopt-unit" align="left" >
                                        <script src="assets/countdown/countdown.js"></script>
                                        <script type="application/javascript">
                                            var myCountdown2 = new Countdown({
                                            time: 0, 
                                            width:200, 
                                            height:80, 
                                            rangeHi:"minute"	// <- no comma on last item!
                                            });

                                        </script>
                                    </div>
                                </td>
                                <td align="right" width="30">







                                    <ul class="active span2 nav nav-pills nav-stacked">
                                        <li class="active">
                                            <a href="#">
                                                <span class="badge pull-right"><h4>${fn:getString( requestScope.result_set, 'temp_result')}</h4></span>
                                                Score
                                            </a>
                                        </li>
                                    </ul>
                                </td>


                            </tr>
                        </table>

						<br>
						<center>
							<h4 style="color: #009999">${requestScope.answer_submitted }</h4>
							<h3>
								<html:errors></html:errors>
							</h3>
							<br>

							<button id="myBtn"
								class="g-interactivepost btn btn-default btn-large btn-primary"
								data-contenturl="http://gcdc2013-perceptrix.appspot.com/"
								data-contentdeeplinkid="http://gcdc2013-perceptrix.appspot.com/"
								data-clientid="651681050519-oucs6ptarq1o1j3lpn89ruiqm3sparct.apps.googleusercontent.com"
								data-cookiepolicy="single_host_origin"
								data-prefilltext="Heya friends! I am playing Perceptrix at http://perceptrix.tk     .
	Its so much fun and easy. My current scores is ${fn:getString(requestScope.result_set, 'temp_result')}  :) #perceptrix"
								data-calltoactionlabel="PLAY" data-calltoactionlabel="PLAY"
								data-calltoactionurl="http://gcdc2013-perceptrix.appspot.com/"
								data-calltoactiondeeplinkid="http://gcdc2013-perceptrix.appspot.com/">Spread
								the word about Perceptrix on Google+</button>

						</center>

					</div>
                        
                        
                        
                        
            </div>
        </div>



    </div>
</div>



	<div id="example" class="modal  fade " style="display: none;">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>Disclaimer</h3>
		</div>
		<div class="modal-body">
			<p>1. Enable JavaScipt in your browser</p>
			<p>2. Please make sure that your internet connection is reliable and fast enough because you can attempt any question only once</p>
			<p>3. Marks on the 'Score Board' will change as and only when you'll attempt 3 or multiple integral of 3 questions!</p>
			
		
		</div>
		<div class="modal-footer">
			<a href="#"
				class="btn btn-success" data-dismiss="modal">Ok, Got it!</a>
		</div>
	</div>




	<script type="text/javascript">
  (function() {
   var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
   po.src = 'https://apis.google.com/js/client:plusone.js';
   var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
 })();
</script>

<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap-transition.js"></script>
<script src="assets/js/bootstrap-alert.js"></script>
<script src="assets/js/bootstrap-modal.js"></script>
<script src="assets/js/bootstrap-dropdown.js"></script>
<script src="assets/js/bootstrap-scrollspy.js"></script>
<script src="assets/js/bootstrap-tab.js"></script>
<script src="assets/js/bootstrap-tooltip.js"></script>
<script src="assets/js/bootstrap-popover.js"></script>
<script src="assets/js/bootstrap-button.js"></script>
<script src="assets/js/bootstrap-collapse.js"></script>
<script src="assets/js/bootstrap-carousel.js"></script>
<script src="assets/js/bootstrap-typeahead.js"></script>




</body>
</html>
