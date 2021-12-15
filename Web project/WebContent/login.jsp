<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Processing login...</title>
    
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
	    	//load the jdbc driver
	    	Class.forName(driverName);
			//connect to the database server	   
		    connection = DriverManager.getConnection(
		    connectionUrl + dbName, userId, password);
			PreparedStatement stmt = connection.prepareStatement("select name from students where matric =? and password= ?");
		 
			stmt.setString(1,request.getParameter("username"));
			stmt.setString(2,request.getParameter("password"));
			
			
		    ResultSet rs = stmt.executeQuery();
		    if(rs.next()) {
		    	login = true;
		    }
	    } catch(Exception e) {
	    	out.println(e.getMessage());
	    }
		    
		    
    
    if(login) {
	    %>
	    show the table below
	    
	    <p>processing login...<a href="changePassword.jsp">Change Password</a></p>
	
	    <p><a href="Results.jsp">show result</a>  </p>
	
	
	    <% //opening tag for java code
	      out.println("Hello ");       //java 
	    %>
	    <p>This is to display a single value (returned value)</p>
	    <%=request.getParameter("username")%>
	
	    , your password is 
	
	    <%=request.getParameter("password")%>
	    
	    
	    <p> Your Matric is :  <%=request.getParameter("username")%> </p>
    
    

    <%
	    try {
		    statement = connection.createStatement();
		    ResultSet rs = statement.executeQuery("select matric, students.name, dob, departments.name as department from students left join departments on department=departments.id");
	%>
	<div class ='table'>
	  <table border="1"  >
	  	<tr>
	  	  <th>Matric</th>
	  	  <th>Name</th>
	  	  <th>DOB</th>
	  	  <th>Department</th>
	  	  <th>Action</th>
	  	</tr>
	<%
	   
		    while(rs.next()) {
		    //	out.println("<p>" + rs.getString("dob") + "</p>");
		    
	%> 

       	    <tr>
       	      <td><%=rs.getString("matric")%></td>
       	      <td><%=rs.getString("name")%></td>
       	      <td><%=rs.getString("dob")%></td>
       	      <td><%=rs.getString("department")%></td>
       	      <td><a href="Edit.jsp?username"><button type = 'update' class = 'table button'> Edit</button></a>
       	      <a href="Delete.jsp?username"><button type = 'delete'  class = 'table button'> Delete </button></a>
       	      </td>
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