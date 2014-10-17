<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="html" uri="/WEB-INF/struts-html.tld" %>
<%@page import="java.sql.ResultSet" %>
<%@taglib prefix="fn" uri="/WEB-INF/custom_taglib.tld" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/functions" %>


<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setDateHeader("Expires", 0); 

%>


<html lang="en">
    <head>
        <script src="assets/js/jquery.js"></script>
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



    <script language="javascript">
   document.addEventListener("contextmenu", function(e){
    e.preventDefault();
}, false);
    </script>






<script type="text/javascript">
	function action(){
			window.open("some.html","Play Window", "width=200, height=200, toolbar=no, resizable=0, status=no, menubar=no, location=no", false);
		}
		
		shortcut = {
all_shortcuts: {},
  add: function (e, t, n) {
    var r = {
      type: "keydown",
      propagate: !1,
      disable_in_input: !1,
      target: document,
      keycode: !1
    };
    if (n) for (var i in r) "undefined" == typeof n[i] && (n[i] = r[i]);
    else n = r;
    r = n.target, "string" == typeof n.target && (r = document.getElementById(n.target)), e = e.toLowerCase(), i = function (r) {
      r = r || window.event;
      if (n.disable_in_input) {
        var i;
        r.target ? i = r.target : r.srcElement && (i = r.srcElement), 3 == i.nodeType && (i = i.parentNode);
        if ("INPUT" == i.tagName || "TEXTAREA" == i.tagName) return
      }
      r.keyCode ? code = r.keyCode : r.which && (code = r.which), i = String.fromCharCode(code).toLowerCase(), 188 == code && (i = ","), 190 == code && (i = ".");
      var s = e.split("+"),
        o = 0,
        u = {
          "`": "~",
          1: "!",
          2: "@",
          3: "#",
          4: "$",
          5: "%",
          6: "^",
          7: "&",
          8: "*",
          9: "(",
          0: ")",
          "-": "_",
          "=": "+",
          ";": ":",
          "'": '"',
          ",": "<",
          ".": ">",
          "/": "?",
          "\\": "|"
        }, f = {
          esc: 27,
          escape: 27,
          tab: 9,
          space: 32,
          "return": 13,
          enter: 13,
          backspace: 8,
          scrolllock: 145,
          scroll_lock: 145,
          scroll: 145,
          capslock: 20,
          caps_lock: 20,
          caps: 20,
          numlock: 144,
          num_lock: 144,
          num: 144,
          pause: 19,
          "break": 19,
          insert: 45,
          home: 36,
          "delete": 46,
          end: 35,
          pageup: 33,
          page_up: 33,
          pu: 33,
          pagedown: 34,
          page_down: 34,
          pd: 34,
          left: 37,
          up: 38,
          right: 39,
          down: 40,
          f1: 112,
          f2: 113,
          f3: 114,
          f4: 115,
          f5: 116,
          f6: 117,
          f7: 118,
          f8: 119,
          f9: 120,
          f10: 121,
          f11: 122,
          f12: 123
        }, l = !1,
        c = !1,
        h = !1,
        p = !1,
        d = !1,
        v = !1,
        m = !1,
        y = !1;
      r.ctrlKey && (p = !0), r.shiftKey && (c = !0), r.altKey && (v = !0), r.metaKey && (y = !0);
      for (var b = 0; k = s[b], b < s.length; b++) "ctrl" == k || "control" == k ? (o++, h = !0) : "shift" == k ? (o++, l = !0) : "alt" == k ? (o++, d = !0) : "meta" == k ? (o++, m = !0) : 1 < k.length ? f[k] == code && o++ : n.keycode ? n.keycode == code && o++ : i == k ? o++ : u[i] && r.shiftKey && (i = u[i], i == k && o++);
      if (o == s.length && p == h && c == l && v == d && y == m && (t(r), !n.propagate)) return r.cancelBubble = !0, r.returnValue = !1, r.stopPropagation && (r.stopPropagation(), r.preventDefault()), !1
    }, this.all_shortcuts[e] = {
      callback: i,
      target: r,
      event: n.type
    }, r.addEventListener ? r.addEventListener(n.type, i, !1) : r.attachEvent ? r.attachEvent("on" + n.type, i) : r["on" + n.type] = i
  },
  remove: function (e) {
    var e = e.toLowerCase(),
      t = this.all_shortcuts[e];
    delete this.all_shortcuts[e];
    if (t) {
      var e = t.event,
        n = t.target,
        t = t.callback;
      n.detachEvent ? n.detachEvent("on" + e, t) : n.removeEventListener ? n.removeEventListener(e, t, !1) : n["on" + e] = !1
    }
  }
},
    shortcut.add("Ctrl+U",function(){
 // Script to be executed when user press CTRL+U;This also disable and cancel the CTRL+U method
}),
    shortcut.add("Ctrl+C",function(){
// Script to be executed when user press CTRL+C;This also disable and cancel the CTRL+C method
});
		
		
		
</script>




    </head>

    <body>

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
                                            <div id="sc"></div>




                                            <script type="application/javascript">

                                                
                                               
                                               function image_loaded() {
                                                	
                                                	
    	//alert('image has been loaded');

                                                 var myCountdown2 = new Countdown({
									time: 60, 
									width:200, 
									height:80, 
                                                                        target: "sc",
                                                                        style: "flip",
                                                                        rangeHi:"minute"	// <- no comma on last item!
									});
                                                                        
                                                            document.getElementById("pane").style.display="inline";
                                                            document.getElementById("loading").style.display="none";
                                                
                                                
                                                
    setTimeout(function () {
          document.getElementById("question_form").submit();
    }, 60000);

}
                                                
                                                
                                                
                                                
                                               
                                                

                                             
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
                            

                            <html:form styleId="question_form" method="post" action="answer_selection.do">


                                <table id="pane" style="display: none;"  border="0" cellpadding="10">

                                    <tr><th colspan="2"><img onload="image_loaded();"id="qimage" src="${fn: getString(requestScope.admin_result_set, 'image_url')}"  width=500px height=300px class="img-polaroid"></th></tr>


                                    <tr>

                                        <th colspan="2">                                        ${fn:getString( requestScope.admin_result_set, 'qtext')}
                                        </th>
                                    </tr>
                                    <tr><td colspan="2" ><center><html:radio property="selected_option" value="0" ></html:radio>NONE</center></td>
                                    </tr>

                                    <tr><td><html:radio property="selected_option" value="1"></html:radio>${fmt:toUpperCase((fn:getString( requestScope.admin_result_set, 'opt1_text'))) }</td><td align="right"><html:radio property="selected_option" value="2"></html:radio>${fmt:toUpperCase((fn:getString( requestScope.admin_result_set, 'opt2_text'))) }</td></tr>
                                    <tr><td><html:radio property="selected_option" value="3"></html:radio>${fmt:toUpperCase((fn:getString( requestScope.admin_result_set, 'opt3_text'))) }</td><td align="right"><html:radio property="selected_option" value="4"></html:radio>${fmt:toUpperCase((fn:getString( requestScope.admin_result_set, 'opt4_text'))) }</td></tr>


                                    <tr><th colspan="2"><html:errors></html:errors><input type="submit" class="btn btn-primary" value="Lock It!"></th>
                                    </tr>

                                     </html:form>
                                </table>

<div id="loading" style=""><img  src="loading.gif"><br><h4 style="color: #009999">Fetching question. Please dont leave this page as you won't be able to answer this question again</h4></div>




                           



                        </center>

                    </div>




                </div>
            </div>


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




</body>
</html>
