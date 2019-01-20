<%-- 
    Document   : player1
    Created on : 13 Nov, 2018, 9:01:39 PM
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
       <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "cricket";
String userid = "root";
String password = "pppppppp";
try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>

<h1>Player statistics</h1>
<table border="1">
<tr>
<td>no_of_matches</td>
<td>runs</td>
<td>wins</td>
<td>loss</td>
<td>wickets</td>

</tr>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cricket?useSSL=false","root","pppppppp");
statement=connection.createStatement();
String sql ="select * from stats";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("no_of_matches") %></td>
<td><%=resultSet.getString("runs") %></td>
<td><%=resultSet.getString("wins") %></td>
<td><%=resultSet.getString("loss") %></td>
<td><%=resultSet.getString("wickets") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>
    </body>
</html>
