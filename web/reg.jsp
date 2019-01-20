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
           
            String username=request.getParameter("user_name");
            String phone=request.getParameter("phone");
            String mail=request.getParameter("mail");
            
            String password=request.getParameter("password");
            String type=request.getParameter("type");
             
             
             
             Class.forName("com.mysql.jdbc.Driver").newInstance();
             java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cricket?useSSL=false","root","pppppppp");
             
             if(type.equals("admin"))
             {
                 CallableStatement calstat=con.prepareCall("{CALL register(?,?,?,?,?)}");
                 calstat.setString(1,username);
                 calstat.setString(2,phone);
                 calstat.setString(3,mail);
                
                 calstat.setString(4,password);
                 calstat.setString(5,type);
                  
                 ResultSet rs=calstat.executeQuery();
                 con.close();
                         calstat.close();
                         out.println("your data has been inserted into table");
                          response.sendRedirect("login.html");
                         
                 
             }
             if(type.equals("user"))
             {
                 CallableStatement calstat=con.prepareCall("{CALL register(?,?,?,?,?)}");
                 calstat.setString(1,username);
                 calstat.setString(2,phone);
                 calstat.setString(3,mail);
                
                 calstat.setString(4,password);
                 calstat.setString(5,type);
                  
                 ResultSet rs=calstat.executeQuery();
                 con.close();
                         calstat.close();
                         out.println("your data has been inserted into table");
                          response.sendRedirect("login.html");
                         
                 
             }
             %>
            
        
    </body>
</html>
