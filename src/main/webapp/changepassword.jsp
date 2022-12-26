<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="changedetailheader.jsp" %>
<%@include file="foot.jsp" %>
<html>
<head>
<title>Message me</title>
<style>
.button{
	width:200px;
	background-color:black;
	color:white;
}
form{
	margin-top:70px;
}
</style>
</head>

<body>
<%
String msg=request.getParameter("msg");
if("notmatch".equals(msg))
{
%>
<h3 class="alert">New Password and Confirm password does not match!</h3>
<%} %>
<% 
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Old password is wrong!</h3>
<%} %>
<% 
if("done".equals(msg))
{
%>
<h3 class="alert">Password change successfully</h3>
<%} %>
<% 
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! try again</h3>
<%} %>

<form action="changepasswordaction.jsp" method="post">
<h3>Enter old password</h3>
<input type="password" name="oldpassword" placeholder="enter old password" required class="inputstyle">
<hr>
<h3>Enter new password</h3>
<input type="password" name="newpassword" placeholder="enter new password" required class="inputstyle">

<hr>
<h3>Enter confirm password</h3>
<input type="password" name="confirmpassword" placeholder="enter confirm password" required class="inputstyle"><br><br>
<button type="submit" class="button">save</button>
</form>
</body>
</html>