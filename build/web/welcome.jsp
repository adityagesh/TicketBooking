<%-- 
    Document   : welcome.jsp
    Created on : 6 Nov, 2017, 9:29:58 PM
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
select {
    width: 50%;
    padding: 2px 10px; 
    margin: 8px 0;
    box-sizing: border-box;
    border: 1px solid #555;
    outline: none;
}

input[type=text]:focus {
    background-color: lightblue;
}
 
input[type=submit] {
     background-color: #DB9603;
    border: none;
    color: white;
    padding: 10px 39px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
}

</style>
</head>
<body>
<div class="header">
	<div class="header-top">
		<div class="wrap">
			<div class="banner-no">
		  		<img src="images/banner-no.png" alt=""/>
		    </div>
			  <div class="nav-wrap">
					<ul class="group" id="example-one">
			           <li><a href="index.html">Home</a></li>
                                   <li class="current_page_item"><a href="/movie_booking/welcome.jsp">Book</a></li>
			           <li><a href="/movie_booking/history.jsp">Booking History</a></li>
			  		   <li><a href="contact.html">Contact</a></li>
                                           <li><a href="/movie_booking/logout.jsp">Logout</a></li>
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
</div>
    <div class="content" >
	<div class="wrap">
		<div class="content-top">
				<div class="listview_1_of_3 images_1_of_3">
        <% String min=new java.sql.Date(System.currentTimeMillis()).toString();
        java.sql.Date now = new java.sql.Date( new java.util.Date().getTime() );
        String max= new java.sql.Date( now.getTime() + 24*7*60*60*1000).toString();%>
        
        <h3>Welcome, <%=session.getAttribute("name")%></h3>
        <form method="POST" action="book.jsp">
                Movie:<select name="movie">
                    <option value="overtake">Overtake</option>
                    <option value="villan">Villan</option>
                    <option value="lavakusha">Lavakusha</option>
                    <option value="parava">Parava</option>
                </select> <br><br>
                 Time: <select name="time">
                    <option value="11">11:00am</option>
                    <option value="2">2:00pm</option>
                    <option value="6">6:00pm</option>
                    <option value="9">9:00pm</option>
                  </select><br><br>
               Count: <select name="count">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select><br><br>
            Date:<input type="date" name="date" value=<%out.println(min);%> min=<%out.println(min);%> max=<%out.println(max);%>>
            <br><br> <input type="submit" value="Book">
             </form>
                                </div>
                </div>
        </div>
    </div>
                
    </body>
</html>
