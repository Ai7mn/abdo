<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Result</title>


<link rel='stylesheet' type='text/css' media='screen' href='mycss1.css'>


<script>

 
 function validateForm(){
		if(document.getElementById('user').value == ''){
			alert ('Username is compulsory');
			
		}
		else if(document.getElementById('sem').value == ''){
			alert ('Semester is compulsory');
			
		}
		else if(document.getElementById('gpa').value == ''){
			alert ('GPA id is compulsory');
			
		}
		else if (document.getElementById('cgpa').value == ''){
			alert ('CGPA id is compulsory');
			
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
   
   <h1>Add a Result</h1>
            <hr>
            
            
<form id ='form'  action="AddResultsProcess.jsp" method="POST">
	<p>Username: <input type="text"  id = 'user' name="username"  value="<%=request.getParameter("username")%>"  /></p> 
	<p>Semester: <input type="text"  id = 'sem' name="semester"  "  /></p> 
	<p>GPA: <input type="text"  id = 'gpa' name="gpa"  "  /></p> 
	<p>CGPA: <input type="text"  id = 'cgpa' name="cgpa"  "  /></p> 
	<p> <Button type = 'button'  onclick = 'validateForm()' class='contain Btn' >Add Result</button></p>
	
	
	
	
</form>
</div>
</body>
</html>