<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");
try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement st=con.prepareStatement("insert into product values(?,?,?,?,?)");
	st.setString(1,id);
	st.setString(2,name);
	st.setString(3,category);
	st.setString(4,price);
	st.setString(5,active);
	st.executeUpdate();
	response.sendRedirect("addnewproduct.jsp?msg=done");
	
}catch(Exception e)
{
	System.out.println(e.getMessage());
	response.sendRedirect("addnewproduct.jsp?msg=wrong");
}



%>