<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" xmlns:ng="http://angularjs.org">
  <head>
    <meta charset="utf-8">
    <title>Perceptrix</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
	 <link href="assets/css/bootstrap1.css" rel="stylesheet">
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
  </head>

  <body onload="startup()">
 

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
                            <c:if test="${ !(sessionScope.email_id eq null)}">
                            
                             <!-- picking values from session -->
	
        <span ng-show="userProfile" >
	        <a target="_blank" href="${sessionScope.google_plus_url}">
	          <span class="name" ><font  id="google_name" size="4" color="red">${sessionScope.display_name }</font></span>
	          <img height="32" width="32" src="${sessionScope.image_url }" />
	        </a>
	      
         </span>
                            </c:if>
                        </p>
                        <ul class="nav">
                            <li ><a href="home.do">Home</a></li>
                            <li><a href="initiateplay.do">Play</a></li>
                            <li ><a href="credits.do">Credits</a></li>
                            <li class="active"><a href="help.do">Help</a><li>


                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>
	
<div ><table border="0" width="100%"> <tr> <td align="left"><a target="_blank" href="https://www.facebook.com/united.technophile"><img src="tp.png" width="296" height="80"></a></td><td align="right"><a target="_blank" href="https://sites.google.com/site/gdgallahabad/"><img src="gdg.jpg"  width="296" height="80" align="right"></a></td></tr></table>
    </div>
     <div class="container-fluid">
      <div class="row-fluid">
        <div class="span10">
		<div class="quest-unit">
			
        </div>  	
		<div class="span40 offset2 ">
				<!--Body content-->
				<h2><font color="purple"><u>Rules</u></font></h2>
					<h4><ol>
						<li>A set of images will be displayed while you play. Each image has a hidden message 
							that you have to perceive.</li>&nbsp;
						<li>With an image you will be given 4 options from which you have to select the correct
							option, that is your perception.</li>&nbsp;
						<li>You cannot alter your choice for an image, once you have submitted a peception for
							that image.</li>&nbsp;
						
						<li><p>Last and most important you will be given 60 seconds for each image, if you don't submit an answer in that time span then by default "none" will be selected.</p></li>
					</ol></h4>&nbsp;&nbsp;&nbsp;
					
					<h2><font color="purple"><u>Contact us</u></font></h2>
					<h4><ul>&nbsp;&nbsp;
						<li>Krishna Gupta (pokekrishna@gmail.com) (+91 7499 483348)</li>&nbsp;
					</ul></h4>
					
					</div>
				</div>
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
