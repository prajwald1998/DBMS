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

                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String team_name = request.getParameter("team_name");
                String player_type = request.getParameter("player_type");
               
                try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricket?useSSL=false", "root", "pppppppp");

                CallableStatement calstat = con.prepareCall("{CALL player(?,?,?,?)}");
                calstat.setString(1, id);
                calstat.setString(2, name);
                calstat.setString(3, team_name);
                calstat.setString(4, player_type);
              
                calstat.executeQuery();
                
                
                con.close();
                calstat.close();
                out.println("your data has been inserted into table");
                response.sendRedirect("schedule.html");

            }
            catch(Exception e){
            out.println("databse error "+e);
            }

        %>


    </body>
</html>
