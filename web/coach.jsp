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

                String cid = request.getParameter("cid");
                String cname = request.getParameter("cname");
                String country = request.getParameter("country");
                
               
                try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricket?useSSL=false", "root", "pppppppp");

                CallableStatement calstat = con.prepareCall("{CALL coach(?,?,?)}");
                calstat.setString(1, cid);
                calstat.setString(2, cname);
                calstat.setString(3, country);
                
              
                calstat.executeQuery();
                
                
                con.close();
                calstat.close();
                out.println("your data has been inserted into table");
                response.sendRedirect("stats.html");

            }
            catch(Exception e){
            out.println("databse error "+e);
            }

        %>


    </body>
</html>
