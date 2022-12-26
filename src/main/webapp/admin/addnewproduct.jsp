<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHead.jsp" %>
<%@include file="../foot.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>
<style>
.div1{
	width:26em;
	display:inline-block;
}
.addpr{
	width:290px;

}
</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
	<h3 style="text-align:center;color:brown">New Product Added!</h3>
	
<%} %>
<% 
if("wrong".equals(msg)){
	%>
	<h3>something went wrong</h3>
	<%} %>
	<%
	int id=1;
	try{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select max(id) from product");
		while(rs.next())
		{
			id=rs.getInt(1);
			id=id+1;
		}
	}catch(Exception e)
	{
		System.out.println(e);
	}
	%>
	<form action="addnewproductaction.jsp" method="post">
	<h3 style="color:brown">Product ID:<%out.println(id);%></h3>
	<input type="hidden" name="id" value="<%out.println(id);%>">
	
	<div class="div1">
		<h3>Enter Name</h3>
		<input class="addpr" type="text" name="name" placeholder="enter name" required>
		
		<hr>
	</div>
	<div class="div1">
		<h3>Enter Category</h3>
		<input class="addpr" type="text" name="category" placeholder="enter category" required>	
		<hr>
	</div>
	<div class="div1">
		<h3>Enter Price</h3>
		<input class="addpr" type="number" name="price" placeholder="enter price" required>
		<hr>
	</div>
	<div class="div1">
		<h3>Active</h3>
		<select class="addpr" name="active">
			<option value="yes">Yes</option>
			<option value="no">No</option>
		</select>
		<hr>
	</div><br><br>
	<button style="border-radius:25px;width:100px;">save  </button>
	</form>
	<br><br>
</body>
</html>