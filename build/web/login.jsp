<%-- 
    Document   : login
    Created on : 6 Nov, 2017, 5:48:36 PM
    Author     : Aditya
--%>

 
 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>05 Cinema</title>
    </head>
    <body>
       <!DOCTYPE HTML>
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
			           <li class="current_page_item"><a href="index.html">Home</a></li>
			           <li><a href="movie_booking/#reg">Login/Register</a></li>
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
</div>
        <%@page   import="java.sql.*" %>
        <%
        String name = request.getParameter("uname");
        String password = request.getParameter("password");
        String USERNAME="root";
        int flag=0;
        String PASSWORD="";
        String CONN_STRING="jdbc:mysql://localhost:3306/test";
        Connection conn=null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(CONN_STRING,USERNAME,PASSWORD);
            String sql = "select * from user where username=? and Password=?";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            rs = ps.executeQuery();
          
         if(rs.next())
    { 
    String userdbName = rs.getString("username");
    String userdbPsw = rs.getString("Password");
    String Name=rs.getString("Name");
    if(name.equals(userdbName) && password.equals(userdbPsw))
    {
     flag=1;
    }if(flag==1){
        session.setAttribute("name",Name);
        session.setAttribute("uname",name);
        response.sendRedirect("welcome.jsp");
    }if(flag==0)
    {       RequestDispatcher rd=request.getRequestDispatcher("index.html");  
            rd.include(request, response);}                //not working
    rs.close();
    ps.close(); 
    }        
        }catch(SQLException e){
            System.err.println(e);
        }catch (Exception e) {
            e.printStackTrace();
        }
     
        %>
  <div class="content" >
	<div class="wrap">
		<div class="content-top">
				
        <h3 color="red">Error: Incorrect Username/Password</h3>
                                
                </div>
        </div>
  </div>
      
    </body>
</html>
