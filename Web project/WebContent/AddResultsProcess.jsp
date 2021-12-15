<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adding Resutlts process...</title>
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
    	 	
    	if (login){
    		try{
    			Statement stmt1 = connection.createStatement();
    			stmt1.execute("drop trigger log_result");
    			
    			Statement stmt2 = connection.createStatement();
    			stmt2.execute("CREATE TRIGGER log_result AFTER INSERT ON result " //
    					+  "FOR EACH ROW " //
    	       			+  "INSERT INTO log VALUES (now(), 'New result inserted '," + request.getParameter("username") + ");" );
    			
    			PreparedStatement stmt = connection.prepareStatement("insert into result values (? ,? ,? , ?)");
    			
    			stmt.setString(1 , request.getParameter("username"));
    			stmt.setString(2, request.getParameter("semester"));
    			stmt.setString(3 , request.getParameter("gpa"));
    			
    			stmt.setString(4 , request.getParameter("cgpa"));
    			int row = stmt.executeUpdate();
    			
    			if(row>0){
    				out.println(row + "Result was Added");
    			} else {
    				out.println("Failed to Add Result");
    			}
    			
    	
    
    			%>
    			<% 
    			
    		}catch(Exception e) {
    			out.println(e.getMessage());
    			
    		}
    	} else {
    	%>
    	<p> Login Failed</p>
    	<%
    	}
    	%>
    	}

</p>
</body>
</html>