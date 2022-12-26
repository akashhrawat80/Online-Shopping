<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>
<style>
	#div1{
		display:table-cell;
		width:600px
	}
	#div2{
		display:table-cell;
		width:600px
	}
	h1{
		margin-left:30px;
		font-size:40px;
		color:Orange;
	}
	input{
		width:255px;
	}
	body
	{
		background-color:lightblue;
	}
</style>
</head>
<body>
<div id="container">
	<div class="signup" id="div1">
		<form action="signupaction.jsp" method="POST">
			<input type="text" name="name" placeholder="enter name" required><br><br>
			<input type="email" name="email" placeholder="enter email" required><br><br>
			<input type="number" name="phone" placeholder="enter phone number" required><br><br>
			<select name="securityQuestion" required>
				<option value="What was your first pet name?">What was your first pet name?</option>
				<option value="what was your first school name?">what was your first school name?</option>
				<option value="what is your first nickname?">what is your first nickname?</option>
				<option value="what elementary school did you attend?">what elementary school did you attend?</option>
			</select><br><br>
			<input type="text" name="answer" placeholder="answer" required><br><br>
			<input type="password" name="password" placeholder="Enter Password" required><br><br><br>
			<input type="submit" value="SignUp" style="width:150px;border-radius:25px;background-color:black;color:white;">
		</form>
		<h2><a href="login.jsp" style="padding-left:44px;text-decoration:none;">Login</a></h2>
	</div>
	<div class="whysign" id="div2">
	<%
		String msg=request.getParameter("msg");
		if("valid".equals(msg)){
			%>
				<h2>Successfully Updated</h2>
			<% 
			}
	%>
	<%
		if("invalid".equals(msg))
		{
			%>
				<h2>Some thing is wrong! Try Again!</h2>
			<%
		}
	%>
		
			<h1>eShopping</h1>
			<p style="font-family:sans-serif;"><i>The eShopping system is the application that allows the users to shop online without moving physically!</i></p>
	
	</div>
</div>

</body>
</html>