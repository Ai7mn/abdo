<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Student deleting process ...</title>
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
			
			
			connection.setAutoCommit(false);
			
			
    	}catch(Exception e) {
		    	out.println(e.getMessage());
		    }
    	
    	
    	
    	
    	if (login){
    		try{
    			PreparedStatement stmt = connection.prepareStatement("delete from students where matric=?");
    			
    			stmt.setString(1 , request.getParameter("username"));
    			int row = stmt.executeUpdate();
    			
    			connection.commit();
    			out.println("Student was deleted ");
    			
    			
    			}catch(Exception e) {
    			out.println(e.getMessage());
    			
    		
    		 
    		if(connection!=null){
    			try{
    			connection.rollback();
    			out.println("The students was not deleted");
    		
    			}catch(SQLException w){
    				out.println(w.getMessage());
    			}
    			
    		  }
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