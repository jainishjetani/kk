<%-- 
    Document   : Show
    Created on : Sep 21, 2020, 11:00:41 AM
    Author     : Jetani
--%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Jsp Sample</title>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import ="java.sql.PreparedStatement"%>
<%@page import ="java.sql.Connection" %>
<%@page import ="java.sql.DriverManager"%>
<%@page import ="java.sql.SQLException"%>
<%@page import ="java.sql.*"%>
</head>

<body>
    
    
    <%
           
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String dbName = "StudentDB";
        String userName = "admin";
        String password = "123admin";
        String hostname = "database-1.c6jevgf51ssc.us-east-1.rds.amazonaws.com";
        String port = "3306";
        //String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" + userName + "&password=" + password;
        //String jdbcUrl = 
        
        
        Connection con=DriverManager.getConnection("jdbc:mysql://database-1.c6jevgf51ssc.us-east-1.rds.amazonaws.com:3306/StudentDB?useSSL=false","admin","123admin");
        Statement st=con.createStatement();
   try
    {        
        ResultSet rs=st.executeQuery("select * from studenttable;");
    %>
    
    
    <table border=1 align=center style="text-align:center">
      <thead>
          <tr>
             <th>ID</th>
             <th>NAME</th>
             <th>Email</th>
             <th>city</th>
             <th>phone</th>
             <th>department</th>
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("id") %></td>
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getString("email") %></td>
                <td><%=rs.getString("city") %></td>
                <td><%=rs.getString("phone") %></td>
                <td><%=rs.getString("department") %></td>
            </tr>
            <%}%>
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    finally{
       st.close();
       con.close();
    }
    %>
</body>
    
</html>