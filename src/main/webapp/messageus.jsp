<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="foot.jsp" %>

<html>
<head>
<title>Message us</title>
</head>
<body>
<div style="color:Black;text-align:center;font-size:30px;font-family:fantasy;"><b>Message Us</b></div>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 style="text-align:center; color:yellow;">Message Successfully sent. Our team will contact you shortly!</h3>
<%} %>
 <% 
 if("invalid".equals(msg))
 {
 %>
<h3 style="text-align:center;">Some thing went wrong! try again</h3>
<%} %>
<form action="messageusaction.jsp" method="post">
<input type="text" name="subject" type="text" placeholder="subject" required>
<hr>
<textarea name="body" placeholder="enter your message" rows=20 cols=100></textarea>
<hr>
<button class="button" type="submit">Send</button>
</form>
<br>
<br>
<br>
</body>
</html>