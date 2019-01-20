<%-- 
    Document   : reg
    Created on : 1 Nov, 2018, 7:44:11 PM
    Author     : p
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%@ page import="javax.sql.*" %>
        <%
           
           
            String runs=request.getParameter("runs");
            String wins=request.getParameter("wins");
            
            String loss=request.getParameter("loss");
             String wickets=request.getParameter("wickets");
           
             
             try{
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cricket?useSSL=false","root","pppppppp");
             
             
             
                 CallableStatement calstat=con.prepareCall("{CALL stats(?,?,?,?)}");
                 
                 calstat.setString(1,runs);
                 calstat.setString(2,wins);
                
                 calstat.setString(3,loss);
                 calstat.setString(4,wickets);
                 
                  
                 ResultSet rs=calstat.executeQuery();
                 con.close();
                         calstat.close();
                         out.println("your data has been inserted into table");
                          response.sendRedirect("link.html");
                          
             }catch(Exception e)
             {
                 out.println("databse error "+e);    
                 
             }
             %>
            
        
    </body>
</html>
