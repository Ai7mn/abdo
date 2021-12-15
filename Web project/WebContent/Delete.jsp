<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>

<link rel='stylesheet' type='text/css' media='screen' href='mycss1.css'>

<script>
 function validateForm(){
		if(document.getElementById('user').value == ''){
			alert ('Username is compulsory');
			
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
            
            
<form id ='form'  action="Studentdeleteprocess.jsp" method="POST">
	<p>Username: <input type="text"  id = 'user' name="username"  value="<%=request.getParameter("username")%>"  /></p> 
	
	<p> <Button type = 'button'  onclick = 'validateForm()' class='contain Btn' >Delete</button></p>
	
</form>
</div>
</body>
</html>