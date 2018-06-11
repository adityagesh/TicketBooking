/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movie_booking;
import java.sql.*;

/**
 *
 * @author Aditya
 */
public class movie_booking {
    public static final String USERNAME="root";
    public static final String PASSWORD="";
    public static final String CONN_STRING="jdbc:mysql://localhost:3306/test";
    public static void main(String args[]){
        Connection conn=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection(CONN_STRING,USERNAME,PASSWORD);
            System.out.println("Connected");
            Statement smt=conn.createStatement();
            String query="INSERT INTO name values('Hello1')";
            smt.executeUpdate(query);
        }catch(SQLException e){
            System.err.println(e);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
