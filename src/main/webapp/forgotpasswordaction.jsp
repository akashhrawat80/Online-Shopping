<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String phone2=request.getParameter("phone2");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String newpassword=request.getParameter("newpassword");
int i=0;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and mobilenumber='"+phone2+"' and securityQuestion='"+securityQuestion+"' and answer='"+answer+"'");
	while(rs.next())
	{
		i=1;
		st.executeUpdate("update users set password='"+newpassword+"' where email='"+email+"'");
		response.sendRedirect("forgotpassword.jsp?msg=done");
	}
	if(i==0){
		response.sendRedirect("forgotpassword.jsp?msg=invalid");
	}
}catch(Exception e)
{
	System.out.println(e.getMessage());
}

%>