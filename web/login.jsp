<%-- 
    Document   : login
    Created on : 2 Nov, 2018, 7:51:51 PM
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
        <%@ page import="java.sql.*;"%>
        <%@ page import="javax.sql.*;"%>
        <%
            String user_name = request.getParameter("username");
            String password = request.getParameter("password");
            String _type = request.getParameter("type");
            if (user_name != null) {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricket?useSSL=false", "root", "pppppppp");
                if (_type.equals("admin")) {
                    String Query = "select * from register where user_name=? and password=?";
                    PreparedStatement psm = conn.prepareStatement(Query);
                    psm.setString(1, user_name);
                    psm.setString(2, password);
                    ResultSet rs = psm.executeQuery();
                  if(rs.next())
                  {
                    response.sendRedirect("player.html");
                  }
                   else{
                out.println("Please check password again!!!");
            }

                }
            }
           
        %>



    </body>

</html>
