<%-- 
    Document   : register.jsp
    Created on : 7 Nov, 2017, 1:25:55 AM
    Author     : Aditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page   import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>05 Cinema</title>
    </head>
    <body>
       
        <% 
        String uname = request.getParameter("uname");
        String pass= request.getParameter("password");
        int phone= Integer.parseInt(request.getParameter("phone"));
        String name= request.getParameter("name");
        String USERNAME="root";
        int flag=0;
        String PASSWORD="";
        String CONN_STRING="jdbc:mysql://localhost:3306/test";
        Connection conn=null;
        Statement stmt=null;
        String sql=String.format("INSERT INTO USER (Name,Phone,Password,username)values('%s',%d,'%s','%s');",name,phone,pass,uname);
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(CONN_STRING,USERNAME,PASSWORD);
            stmt=conn.createStatement();
            stmt.executeUpdate(sql);
            RequestDispatcher rd=request.getRequestDispatcher("index.html");  
            rd.include(request, response);
        }catch(SQLException e){
            System.err.println(e);
        }catch (Exception e) {
            e.printStackTrace();
        }
          
        %>
        </body>
            
            
</html>
