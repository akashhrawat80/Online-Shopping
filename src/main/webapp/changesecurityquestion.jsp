<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="changedetailheader.jsp" %>
<%@include file="foot.jsp" %>
<html>
<head>
<title>add or change address</title>
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
<h3>Security question Successfully Updated!!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3>password is wrong!  Try again!</h3>
<%} %>
<form action="changesecurityquestionaction.jsp" method="post">
<h3>Select your new security question</h3>
<select name="securityquestion">
<option value="what was your first car?">what was your first car?</option>
<option value="what was the name of your first pet?">what was the name of your first pet?</option>
<option value="where did you study post graduation?">where did you study post graduation?</option>
<option value="what is the name of the town where you were born?">what is the name of the town where you were born?</option>
</select>
<hr>
<h3>Enter Your New Answer </h3>
<input type="text" name="newanswer" placeholder="enter your new answer" class="inputstyle" required>
<hr>
<h3>Enter password(for security)</h3>
<input type="password" name="password" placeholder="enter password(for security)" class="inputstyle">
<hr>
<button type="submit">save</button>
</form>
</body>
</html>