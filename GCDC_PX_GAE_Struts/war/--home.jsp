<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>


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

<body onload="startup()">  

<div class="container">  



<div id="example" class="modal hide fade in" style="display: none; ">  
<div class="modal-header">  
  
<h3>This is a Modal Heading</h3>  
</div>  
<div class="modal-body">  
<h4>Text in a modal</h4>  
<p>You can add some text here.</p>                
</div>  
<div class="modal-footer">  
</div>  
</div>  

<p><a id="init-modal" data-toggle="modal" href="#example" class="btn btn-primary btn-large">Launch demo modal</a></p>  



</div>  



</body>
</html>