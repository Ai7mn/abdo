<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit A Student</title>

<link rel='stylesheet' type='text/css' media='screen' href='mycss1.css'>

<script>
function validateForm(){
		if(document.getElementById('user').value == ''){
			alert ('username is compulsory');
			
		}
		else if (document.getElementById('name').value == ''){
			alert ('You entered an invalid name');
			
		}
		else {
			//everything is valid
			document.getElementById('form').submit();
		}
	}
	</script>
</head>
<body>

<div class ='contain'>
   
   <h1>Edit a student</h1>
            <hr>
            



<form id ='form' action="Editing_Student_process.jsp" method="POST">
	<p>Username: <input type="text" id ='user'  name="username" value="<%=request.getParameter("username")%>"/></p> 
	
	<p>New Name: <input type="text"  id= 'name'  name="newname" /></p>
	
	<p><button type="button" onclick ='validateForm()' class = 'contain Btn' > Submit</button></p>
</form>
</div>
</body>
</html>