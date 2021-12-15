<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>

<link rel='stylesheet' type='text/css' media='screen' href='mycss1.css'>

 <script>

 
 function validateForm(){
		if(document.getElementById('user').value == ''){
			alert ('Name is compulsory');
			
		}
		else if (document.getElementById('pass').value == ''){
			alert ('You entered an invalid password');
			
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
   
   <h1>Delete a student</h1>
            <hr>

<form id = 'form' action="ChangePasswordProcess.jsp" method="POST">
	<p>Username: <input type="text" id = 'user' name="username"   value="<%=request.getParameter("username")%>"/></p> 
	
	<p>New Password: <input type="password" id = 'pass' name="newpass" /></p>
	
	<p><button type = "button" onclick = 'validateForm()' class = 'contain Btn'>Submit</button></p>
</form>
</div>
</body>
</html>