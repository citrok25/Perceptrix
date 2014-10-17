<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" xmlns:ng="http://angularjs.org">
  <head>
    <meta charset="utf-8">
    <title>Perceptrix</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
  <script src="assets/js/jquery.js"></script>
  <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="stylesheets/photohunt.css"/>
  <link rel="stylesheet" href="stylesheets/gh-buttons.css"/>
  <!-- IE Fix for HTML5 Tags -->
  <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  
  <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.0.3/angular.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
  <script src="js/app.js"></script>
  <script src="js/services.js"></script>
  <script src="js/controllers.js"></script>
  <script src="js/filters.js"></script>
  <script src="js/directives.js"></script>
 
 <link href="assets/css/bootstrap.css" rel="stylesheet"> 
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap-modal.js"></script>
 
 

<script type="text/javascript">
	function show_auto_login_modal(){

	$('#example').modal({
		  keyboard: false,
		   backdrop: 'static'
		})
	;
	
	}
	
	
	function hide_auto_login_modal(){
		 $('#example').modal('hide');
	}
</script>

 
<script language="javascript">
function init_play(){
	window.open('http://www.google.com', 'Perceptrix Play', 'fullscreen=yes, location=no, menubar=no, status=no', true);
}
</script>
 
 
 
 <script type='text/javascript'>
  
  
  function startApp() {
    angular.bootstrap(document, ['photoHunt']);  
  }
  </script>
   
   <script type="text/javascript">
   	function changelocation(loc){
   		document.location=loc;
   		setTimeout(function(){location.reload()}, 200);
   	}
   </script> 
    
    <script type="text/javascript">
    			function startup(){
    				
    				

    				
    				
    					
    				window.setInterval(function(){
    					
    					if(document.getElementById("google_name").innerHTML!='{{userProfile.googleDisplayName}}' && document.getElementById("google_name").innerHTML!=''){
                           
                            $('#example').modal('hide');
                            
                        }
    				}, 5000);
    			}
    </script>
    

    
    
        
     <script type="text/javascript">
    			function signin_startup(){
    				
    				

    				$('#example2').modal({
    					  keyboard: false,
    					   backdrop: 'static'
    					})
    				;
    				
    				
    				
    					
    				/*window.setInterval(function(){
    					
    					if(document.getElementById("google_name").innerHTML!="" && document.getElementById("google_name").innerHTML!='{{userProfile.googleDisplayName}}' ){
                            //document.getElementById("loading").style="display: none";
                            $('#example2').modal('hide');
                            
                        }
    				}, 2000);*/
    			}
    </script>
    
    

    
    
    
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 25px;
      }
    </style>
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">

   <link rel="shortcut icon" href="pxicon.ico">
    
    
     
  <script type="text/javascript">
$(function() {
$( "#dialog-modal" ).dialog({
height: 140,
modal: true
});
});
</script>
    
    </head>

  <body ng-controller="PhotoHuntCtrl" ng-cloak  <c:if test="${sessionScope.email_id eq null }" >onload="startup();"</c:if>>
  
   
  

 

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
                        
                        
	
                        
                        
                        


	<c:choose >
            <c:when test="${sessionScope.email_id eq null}">
    <!-- the buttonstarts -->  
        <span id="signin" ng-show="immediateFailed" onclick="signin_startup()">
          <span id="myGsignin"></span>
        </span>
        <span ng-show="userProfile" >
	        <a target="_blank" href="{{userProfile.googlePublicProfileUrl}}">
	          <span class="name" ><font  id="google_name" size="4" color="red">{{userProfile.googleDisplayName}}</font></span>
	          <img ng-src="{{userProfile.googlePublicProfilePhotoUrl|profilePicture:32}}" />
	        </a>
	        <button class="button danger disconnect" ng-click="disconnect()" style="">
	           Disconnect
	         </button>
         </span>
         
         
        
 <!-- the button ends -->

</c:when>


<c:otherwise>
   <!-- picking values from session -->
	<span id="signin" ng-show="immediateFailed" onclick="signin_startup()">
          <span id="myGsignin"></span>
        </span>
        <span ng-show="userProfile" >
	        <a target="_blank" href="${sessionScope.google_plus_url}">
	          <span class="name" ><font  id="google_name" size="4" color="red">${sessionScope.display_name }</font></span>
	          <img height="32" width="32" src="${sessionScope.image_url }" />
	        </a>
	        <button class="button danger disconnect" ng-click="disconnect()" style="">
	           Disconnect
	         </button>
         </span>

</c:otherwise></c:choose>

                        </p>
                        <ul class="nav">
                            <li class="active"><a onclick="changelocation('home.do');" href="home.do">Home</a></li>
                            <li><a    href="initiateplay.do" onclick="changelocation('initiateplay.do')">Play</a></li>
                            <li ><a href="credits.do" onclick="changelocation('credits.do');">Credits</a></li>
                            <li><a href="help.do" onclick="changelocation('help.do');">Help</a><li>


                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>







<div ><table border="0" width="100%"> <tr> <td align="left"><a target="_blank" href="https://www.facebook.com/united.technophile"><img src="tp.png" width="296" height="80"></a></td><th align="center" id="timers">Time left to COMPETE your <font color="red">Percep</font>tion!</th><td align="right"><a target="_blank" href="https://sites.google.com/site/gdgallahabad/"><img src="gdg.jpg"  width="296" height="80" align="right"></a></td></tr></table>
    </div>
    
    
    <c:if test="${!(requestScope.no_session_error eq null)}"><div class="alert alert-danger" ><center><h4>${requestScope.no_session_error}</h4></center></div></c:if>
    
    <iframe src="index.html" style="width:990px;height:554px;max-width:100%;overflow:hidden;border:none;padding:0;margin:0 auto;display:block;" marginheight="0" marginwidth="0"></iframe>
   <!-- <div class="container-fluid">
      <div class="row-fluid">
        <div class="span2">
		<div class="quest-unit">
			  <div class="btn-group offset1">
  
          </div>
		  </div>
        </div>-->
		<div class="span9 offset1">
				<!--Body content-->
					<div class="timeimgopt-unit">
					<div class="row">
					<form>
					<div class="span4 offset">
						
					</div>
					
					<div class="span9 offset">
					
					
					
					<h2><font color="purple" align="left"><u>Technophile</u></font></h2>
					<h4><p><a target="_blank" href="https://www.facebook.com/united.technophile">Technophile</a>  aims at building up a techno-socio & practical outlook among students by working towards the best opportunities for Design, Code and Implementation...</p></h4>
					<h2><font color="purple"><u>Perceptrix</u></font></h2>
					<h4><p>An event in which your perception will let you win.</p></h4>
					<h3><font color="black">Rules</font></h3>
					<h5><ol>
						<li>A set of images will be displayed while you play. Each image has a hidden message 
							that you have to perceive.</li>
						<li>With an image you will be given 4 options from which you have to select the correct
							option, that is your perception.</li>
						<li>You cannot alter your choice for an image, once you have submitted a peception for
							that image.</li>
						
						<li>Last and most important you will be given 60 seconds for each image, if you don't submit an answer in that time span then by default "none" will be selected.</li>
					</ol></h5>
					</div>
					
					</form>
					</div>
				</div>
				</div>
			</div>
		</div>
		
		<script src="assets/countdown/countdown.js"></script>
		<script type="application/javascript">

var myCountdownTest = new Countdown({
								 	year	: 2013,
									month	: 12, 
									day		: 5,
									width	: 350, 
									height	: 70,
									rangeHi: "day",
									target: "timers",
									style: "flip"
									
									});



</script>
		
		
		
		
<div id="example" class="modal fade" style="display: none; ">  
<div class="modal-header">  
  
<h3>Perceptrix Auto-Sign In <img align="right"height="32" width="32" src="loading.gif"></h3>  
</div>  
<div class="modal-body">  
<h4>Signing in using your Google ID</h4>  
<p>This dialog will disappear automatically in a while</p>                
</div>  
<div class="modal-footer">  
</div>  
</div> 		
		
<div id="example2" class="modal fade " style="display: none; ">  
<div class="modal-header">  
<h3>After accepting the request click <a onclick="location.reload();" href="">here</a></h3>  
</div>   
<div class="modal-footer">  
</div>  
</div> 		


		
		
    
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
	

  
   


   <script type="text/javascript">
  window.___gcfg = {
    parsetags: 'explicit'
  };
  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/auth:plusone.js?onload=startApp';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
  $(function() {
    $("#sort").buttonset();
  });
  </script>
  
  
 
  </body>
</html>
