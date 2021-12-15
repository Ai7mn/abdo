<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
 boolean login = false ;
String driver = "com.mysql.jdbc.Driver";
String host = "mysql:jdbc:localhost://3306";
String db = "smp";
String user = "root";
String pass ="Ayman1@1";

   Connection con = null;
   
   
   try{
	   Class.forName(driver);
	   con =  DriverManager.getConnection(host + db ,user,pass) ;
	   PreparedStatement stmt = con.PreparedStatement("select name from students where matric = ? and password = ?");
	   
	   stmt.setString(request.getParameter("username"));
	   stmt.setString(request.getParameter("password"));
	   
	   ResultSet rs = stmt.executeQuery();
	   if(rs.next()){
		   login = true;
	   }
	   
	   
   }
   catch(Exception e){
	   out.println(e.getMessage());
   }


%>

</body>
</html>