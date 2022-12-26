<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="changedetailheader.jsp" %>
<%@include file="foot.jsp" %>
<html>
<head>
<title>change mobile number</title>
<style>
hr{
	padding-right:30%
}
input{
	width:50%;
}
button{
	width:200px;
	background-color:black;
	color:white;
}
body{
	background-color:light-blue;
}
</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3>Mobile Number Successfully Updated!!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3>password is wrong!  Try again!</h3>
<%} %>
<form action="changemobilenumberaction.jsp" method="post">
<h3>Enter your mobile number</h3>
<input type="number" name="mobilenumber" placeholder="enter your mobile number" required>
<hr>
<h3>Enter password(for security)</h3>
<input type="password" name="password" placeholder="enter password(for security)" class="inputstyle">
<hr>
<button type="submit">save</button>
</form>
</body>
</html>