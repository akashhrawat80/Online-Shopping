<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
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
	<div class="signup">
		<form action="forgotpasswordaction.jsp" method="post">
		<fieldset>
		<legend>Change your password</legend>
		<input type="email" name="email" placeholder="enter email" required><br><br>
		<input type="number" name="phone2" placeholder="enter phone number" required><br><br>
		<select name="securityQuestion">
			<option value="What was your first pet name?">What was your first pet name?</option>
			<option value="what was your first school name?">what was your first school name?</option>
			<option value="what is your first nickname?">what is your first nickname?</option>
			<option value="what elementary school did you attend?">what elementary school did you attend?</option>
		</select><br><br>
		<input type="text" name="answer" placeholder="enter answer" required><br><br>
		<input type="password" name="newpassword" placeholder="enter new password" required><br><br>
		<input type="submit" value="Save" style="width:150px;border-radius:25px;background-color:black;color:white;">
		</fieldset>
		</form>
		<h2><a href="login.jsp" style="text-decoration:none;margin-left:50px">Login</a></h2>
	</div>
	<div class="whyforgotpassword">
	<%
	String msg=request.getParameter("msg");
	if("done".equals(msg)){
	%>
	<h2>Password Changed successfully!</h2>
	<%} %>
	<%
	if("invalid".equals(msg)){	
	%>
	<h2>Something is wrong try again!</h2>
	<%} %>
	</div>
</div>
</body>
</html>