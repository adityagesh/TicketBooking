<%-- 
    Document   : book.jsp
    Created on : 6 Nov, 2017, 10:21:41 PM
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
<style>.box {
  margin: 0px auto;
  margin-top: 80px;
  background: #fff9ee
    url(https://subtlepatterns.com/patterns/lightpaperfibers.png);
  color: #333;
  text-transform: uppercase;
  padding: 8px;
  width: 300px;
  font-weight: bold;
  text-shadow: 0px 1px 0px #fff;
  font-family: "arvo";
  font-size: 11px;
  border-left: 1px dashed rgba(51, 51, 51, 0.5);
  -webkit-filter: drop-shadow(0 5px 18px #000);
}

.inner {
  border: 2px dashed rgba(51, 51, 51, 0.5);
  min-height: 100px;
  padding: 8px;
}
.inner h1 {
  padding: 5px 0px;
  margin: 0px;
  font-size: 18px;
  border-bottom: 1px solid rgba(51, 51, 51, 0.3);
  text-align: center;
}
.info {
  width: 100%;
  margin-top: 5px;
}
.info .wp {
  float: left;
  padding: 5px;
  width: 83px;
  text-align: center;
}
.info .wp h2 {
  margin: 8px;
}
.total {
  border-top: 1px solid rgba(51, 51, 51, 0.3);
}

.clearfix:after {
  content: ".";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}
.total h2 {
  padding-left: 00px;
  margin: 10px 0px;
  display: block;
  font-size: 15px;
}
.total p {
  float: right;
  margin: 0px;
  margin-right: 15px;
}

a.buy {
  color: #fff;
  text-align: center;
  font-size: 25px;
  text-decoration: none;
  display: block;
  width: 200px;
  margin: 0px auto;
  margin-top: 50px;
  padding: 5px;
  background: rgba(0, 0, 0, 0.5);
}</style>
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
              <div class="content" >
	<div class="wrap">
		<div class="content-top">
				<div class="listview_1_of_3 images_1_of_3">     
        <h3>Thank You, <%=session.getAttribute("name")%></h3>
                                </div>
                </div>
        </div>
              </div>
        <%@page   import="java.sql.*" %>
        <% String name=(String)session.getAttribute("name");%>
        <%
        String movie = request.getParameter("movie");
        String time = request.getParameter("time");
        String count_temp = request.getParameter("count");
        String date = request.getParameter("date");
        int count = Integer.parseInt(count_temp);
        String USERNAME="root";
        String PASSWORD="";
        String CONN_STRING="jdbc:mysql://localhost:3306/test";
        Connection conn=null;
        PreparedStatement ps = null;
        PreparedStatement ps1=null;
        int booked=0;
        int max_seat=0;
        int free=100;
         ResultSet rs1 = null;
            Statement stmt1;
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn3=DriverManager.getConnection(CONN_STRING,USERNAME,PASSWORD);
            String sql3=String.format("Select sum(count) as c from movie where movie='%s' and time='%s' and date='%s'",movie,time,date);
            stmt1 = conn3.createStatement();
            rs1=stmt1.executeQuery(sql3);
            if(rs1.next()) {
                String c=rs1.getString("c");
                booked=Integer.parseInt(c);
            }
           String sql4=String.format("Select max from screen_val where movie='%s'",movie);
           stmt1 = conn3.createStatement();
           rs1=stmt1.executeQuery(sql4);
            if(rs1.next()) {
                String c=rs1.getString("max");
                max_seat=Integer.parseInt(c);
                
                
            }  
         free=max_seat-booked;
        }catch(SQLException e){
            System.err.println(e);
        }catch (Exception e) {
            e.printStackTrace();
        }
          
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(CONN_STRING,USERNAME,PASSWORD);
            String sql = "insert into movie values(?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, movie);
            ps.setString(3, time);
            ps.setInt(4, count);
            ps.setString(5, date);
            if(free>count){
             ps.executeUpdate();
            } 
            else{
                    RequestDispatcher rd=request.getRequestDispatcher("error.jsp");  
                    rd.include(request, response);
                String msg=String.format("Only %d seats are available",free);
                out.println(msg);
                        }
        }catch(SQLException e){
            System.err.println(e);
        }catch (Exception e) {
            e.printStackTrace();
        }
        %>
        
        
        <%
            ResultSet rs = null;
            Statement stmt;
            String screen=null;
            String append=null;
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn2=DriverManager.getConnection(CONN_STRING,USERNAME,PASSWORD);
            String sql2=String.format("Select screen from screen_val where movie='%s'",movie);
            
            stmt = conn2.createStatement();
            rs=stmt.executeQuery(sql2);
            if(rs.next()) {
                screen=rs.getString("screen");
            }
            if(time.equals("11"))
            {append=":00am";
            }else
                append=":00pm";
            
        }catch(SQLException e){
            System.err.println(e);
        }catch (Exception e) {
            e.printStackTrace();
        }
            
            
            %>
  <div class="box">
		<div class='inner'>
                    <h1>05 Cinema</h1>
		
		<div class='info clearfix'>
			<div class='wp'>Tickets<h2><% out.println(count_temp); %></h2></div>
                        <div class='wp'>Date<h2><% out.println(date); %></h2></div>
                        <div class='wp'>Time<h2><% out.println(time+append); %></h2></div>
		</div>
		<div class='total clearfix'>
			<h2><% out.println(screen+"-");out.println(movie); %></h2>
		</div>
		</div>
	</div>
                
      
    </body>
</html>