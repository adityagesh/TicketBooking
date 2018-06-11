 <%-- 
    Document   : logout.jsp
    Created on : 12 Nov, 2017, 7:14:35 PM
    Author     : Aditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>05 Cinema</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script src="js/modernizr.js"></script>
<script src='js/jquery.min.js'></script>
<script src='js/jquery.color-RGBa-patch.js'></script>
<script src='js/example.js'></script>
<!-- jQuery -->
<!-- FlexSlider -->
  <script defer src="js/jquery.flexslider.js"></script>
  <script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>
  <!-- DC Tabs CSS -->
<link type="text/css" rel="stylesheet" href="http://www.dreamtemplate.com/dreamcodes/tabs/css/tsc_tabs.css" />
 <!-- jQuery Library (skip this step if already called on page ) -->
<script type="text/javascript" src="http://www.dreamtemplate.com/dreamcodes/jquery.min.js"></script> <!-- (do not call twice) -->
 <!-- DC Tabs JS -->
<!--<script type="text/javascript" src="http://www.dreamtemplate.com/dreamcodes/tabs/js/tsc_tabs.js"></script>-->
<link rel="stylesheet" href="css/tsc_tabs.css" type="text/css" media="all" />
<style> 
input {
    width: 50%;
    padding: 2px 10px; 
    margin: 8px 0;
    box-sizing: border-box;
    border: 1px solid #555;
    outline: none;
}

input:focus {
    background-color: #FDBE03;
}
input[type=submit]{
    background-color: #DB9603;
}
</style>
</head>
<body>
   <%session.invalidate();%>
<div class="header">
	<div class="header-top">
		<div class="wrap">
			<div class="banner-no">
		  		<img src="images/banner-no.png" alt=""/>
		    </div>
			  <div class="nav-wrap">
					<ul class="group" id="example-one">
			           <li><a href="index.html">Home</a></li>
			           <li><a href="/movie_booking/index.html#reg">Login/Register</a></li>
                                    <li><a href="contact.html">Contact</a></li>
			        </ul>
			  </div>
 			<div class="clear"></div>
   		</div>
    </div>
<div class="block">
	<div class="wrap">
		<div class="h-logo">
			<a href="index.html"><img src="images/logo.png" alt=""/></a>
		</div>
        
            <div class="clear"></div>
   </div>
</div>

    <div class="content" >
	<div class="wrap">
		<div class="content-top">
                    <div class="listview_1_of_3 images_1_of_3">
                        <h3>You Have Logged Out.</h3>
                    </div></div></div></div>
                    </div>
</div>
</body>
</html>
