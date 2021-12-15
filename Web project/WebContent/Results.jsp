<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
  <head>
    <title> show Results...</title>
    
    <link rel='stylesheet' type='text/css' media='screen' href='mycss2.css'>
     
    </head>
  <body>
    
    <p>

          <% 
         boolean login=false;
	    //check uesrname and password in the database
	    //to connect to the database server
	    String driverName = "com.mysql.jdbc.Driver";
	    String connectionUrl = "jdbc:mysql://localhost:3306/";
	    String dbName = "smp?useTimezone=true&serverTimezone=UTC";
	    String userId = "root";
	    String password = "Ayman1@1";
	    
	    Connection connection = null;
    	Statement statement = null;
    	
    
    	try {
    		login = true;
	    	//load the jdbc driver
	    	Class.forName(driverName);
			//connect to the database server	   
		    connection = DriverManager.getConnection(
		    connectionUrl + dbName, userId, password);
			
			
    	}catch(Exception e) {
		    	out.println(e.getMessage());
		    }
    	
		    
    
    if(login) {
	    %>
	    show the table below
	    
	    <p>processing login...<a href="AddResults.jsp">Add result</a></p>
	
	    <% //opening tag for java code
	      out.println("Hello ");       //java 
	 
	    try {
		    statement = connection.createStatement();
		    ResultSet rs = statement.executeQuery("select matric, semester, gpa , cgpa from result");
	%>
	<div class ='table'>
	  <table border="1"  >
	  	<tr>
	  	  <th>Matric</th>
	  	  <th>semester</th>
	  	  <th>GPA</th>
	  	  <th>CGPA</th>
	  	</tr>
	<%
	   
		    while(rs.next()) {
		    //	out.println("<p>" + rs.getString("dob") + "</p>");
		    
	%> 

       	    <tr>
       	      <td><%=rs.getString("matric")%></td>
       	      <td><%=rs.getString("semester")%></td>
       	      <td><%=rs.getString("gpa")%></td>
       	      <td><%=rs.getString("cgpa")%></td>
       	    
       	    <tr>

    <%
	    	}
	%>
	  </table>
	  </div>
	<%
	    } catch(Exception e) {
	    	out.println(e.getMessage());
	    }
    } else {
    %>
	    <p>login failed</p>
	    <% 
	    //out.println("login failed");
    }
    %>
    </p>
    
    
  </body>
</html>