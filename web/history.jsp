<%-- 
    Document   : history
    Created on : 12 Nov, 2017, 6:15:53 PM
    Author     : Aditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page   import="java.sql.*" %>
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
    div.table-title {
	display: block;
	margin: auto;
	max-width: 600px;
	padding: 5px;
	width: 100%;
}

.table-title h3 {
	color: #565554;
	font-size: 30px;
	font-weight: 400;
	font-style: normal;
	font-family: "Roboto", helvetica, arial, sans-serif;
	text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
	text-transform: uppercase;
}

/*** Table Styles **/

.table-fill {
	background: white;
	border-radius: 3px;
	border-collapse: collapse;
	height: 320px;
	margin: auto;
	max-width: 600px;
	padding: 5px;
	width: 100%;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	animation: float 5s infinite;
}

th {
	color: #d5dde5;
	background: #1b1e24;
	border-bottom: 4px solid #9ea7af;
	border-right: 1px solid #343a45;
	font-size: 23px;
	font-weight: 100;
	padding: 24px;
	text-align: left;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
	vertical-align: middle;
}

th:first-child {
	border-top-left-radius: 3px;
}

th:last-child {
	border-top-right-radius: 3px;
	border-right: none;
}

tr {
	border-top: 1px solid #c1c3d1;
	border-bottom-: 1px solid #c1c3d1;
	color: #666b85;
	font-size: 16px;
	font-weight: normal;
	text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}

tr:hover td {
	background: #4e5066;
	color: #ffffff;
	border-top: 1px solid #22262e;
}

tr:first-child {
	border-top: none;
}

tr:last-child {
	border-bottom: none;
}

tr:nth-child(odd) td {
	background: #dbd6d0;
}

tr:nth-child(odd):hover td {
	background: #4e5066;
}

tr:last-child td:first-child {
	border-bottom-left-radius: 3px;
}

tr:last-child td:last-child {
	border-bottom-right-radius: 3px;
}

td {
	background: #e5e0da;
	padding: 20px;
	text-align: left;
	vertical-align: middle;
	font-weight: 300;
	font-size: 18px;
	text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
	border-right: 1px solid #c1c3d1;
}

td:last-child {
	border-right: 0px;
}

th.text-left {
	text-align: left;
}

th.text-center {
	text-align: center;
}

th.text-right {
	text-align: right;
}

td.text-left {
	text-align: left;
}

td.text-center {
	text-align: center;
}

td.text-right {
	text-align: right;
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
                                   <li><a href="/movie_booking/welcome.jsp">Book</a></li>
			           <li class="current_page_item" ><a href="/movie_booking/history.jsp">Booking History</a></li>
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
    
<center>
        <div class="table-title">
            <h3>Booking History</h3>
        </div>
        <table class="table-fill">
        <% String uname=(String)session.getAttribute("uname");%>
        <%
           
        String USERNAME="root";
        String PASSWORD="";
        String CONN_STRING="jdbc:mysql://localhost:3306/test";
        Connection conn=null;
        int booked=0;
        int max_seat=0;
        int free=100;
        ResultSet rs = null;
        Statement stmt=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(CONN_STRING,USERNAME,PASSWORD);
            String sql=String.format("Select * from movie where username='%s' ORDER BY date",uname);
            stmt=conn.createStatement();
            rs=stmt.executeQuery(sql);
            String append=null;
            if(rs.isBeforeFirst()){
                out.println("<th>");
                out.println("Movie");
                out.println("</th>");
                out.println("<th>");
                out.println("Date");
                out.println("</th>");
                out.println("<th>");
                out.println("Time");
                out.println("</th>");
                out.println("<th>");
                out.println("Count");
                out.println("</th>");
                out.println("</tr>");
            }
            while(rs.next()) {
                out.println("<tr>");
                String movie_name=rs.getString("movie");
                String movie_time=rs.getString("time");
                String movie_date=rs.getString("date");
                String movie_count=rs.getString("count");
                if(movie_time.equals("11"))
                    append=":00am";
                else
                    append=":00pm";
                
                out.println("<td>");
                out.println(movie_name);
                out.println("</td>");
                out.println("<td>");
                out.println(movie_date);
                out.println("</td>");
                out.println("<td>");
                out.println(movie_time+append);
                out.println("</td>");
                out.println("<td>");
                out.println(movie_count);
                out.println("</td>");
                out.println("</tr>");
            }
            }
        catch(SQLException e){
            System.err.println(e);
        }catch (Exception e) {
            e.printStackTrace();
        }
        
        %>
        
        </table>
</center>
    </body>
</html>
