<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
body{
	background-color:light-blue;
}
a{
	text-decoration:none;
	padding-left:40px;
	color:blue;

}
.div1{
	display:inline;
}
.divv
{
	margin-top:-20px;
}
</style>
</head>
<body>
<br>
<div class="divv">
<div class="div1">
	<h2 style="font-family:fantasy;"><center>Change Details</center></h2>
	<%
		String email=session.getAttribute("email").toString();
	%>
	<h3><a href="home.jsp">Back</a></h3>
</div>
	<h3><a href="changedetails.jsp">Your Profile(<%out.println(email); %>)</a></h3>
	
	<a href="changepassword.jsp">Change Password</a>
	<a href="addchangeaddress.jsp">Add or Change address</a>
	<a href="changesecurityquestion.jsp">Change Security Question</a>
	<a href="changemobilenumber.jsp">Change Mobile Number</a>
</div>
<br>
</body>
</html>