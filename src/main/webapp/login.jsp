<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
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
		<form action="loginaction.jsp" method="post">
		<input type="email" name="email" placeholder="enter email" required><br><br>
		<input type="password" name="password" placeholder="enter password" required><br><br>
		<input type="submit" value="login" style="width:150px;border-radius:25px;background-color:black;color:white;">
		</form>
		<h2><a href="signup.jsp" style="text-decoration:none;display:table-cell;">SignUp</a></h2>
		<h2><a href="forgotpassword.jsp" style="text-decoration:none">Forget Password?</a></h2>
	</div>
	<div class="whysignlogin">
	<%
	String msg=request.getParameter("msg");
	if("notexist".equals(msg))
	{
	%>
		<h2>Incorrect UserName or Password</h2>
	<%} %>
	<%
	if("invalid".equals(msg))
	{
	%>
		<h2 style="font-family:serif">Something went Wrong!! try again!</h2>
	<%} %>
	</div>
</div>
</body>
</html>