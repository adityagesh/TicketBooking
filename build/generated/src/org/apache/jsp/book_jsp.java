package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class book_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>05 Cinema</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       \n");
      out.write("        \n");
      out.write("        ");
 String name=(String)session.getAttribute("name");
      out.write("\n");
      out.write("        ");

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
        ResultSet rs = null;
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
            ps.executeUpdate();
                 
        }catch(SQLException e){
            System.err.println(e);
        }catch (Exception e) {
            e.printStackTrace();
        }
        
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        ");

            out.println("hello");
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn2=DriverManager.getConnection(CONN_STRING,USERNAME,PASSWORD);
            String sql2="Select screen from screen_val where movie=?";
            ps1 =conn2.prepareStatement(sql2);
            ps1.setString(1,movie);
            out.println(movie);
            rs = ps1.executeQuery(sql2); 
            if(rs.next()) {
                String c=rs.getString("screen");
                out.println(c);
            }
            /*String sql2="Select sum(count) as c from movie where movie=? and time=? and date=?";
            ps1 =conn2.prepareStatement(sql2);
            ps1.setString(1,movie);
            ps1.setString(2,time);
            ps1.setString(3,date);
            rs = ps1.executeQuery(sql2); 
            if(rs.next()) {
                String c=rs.getString("c");
                out.println("helo");
            }*/
                 
        }catch(SQLException e){
            System.err.println(e);
        }catch (Exception e) {
            e.printStackTrace();
        }
            
            
            
      out.write("\n");
      out.write("  \n");
      out.write("        \n");
      out.write("      \n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
