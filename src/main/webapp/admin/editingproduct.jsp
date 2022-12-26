<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHead.jsp" %>
<%@include file="../foot.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>
<style>
.back{
	color:white;
	margin-left:2.5%;
}
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
<h2><a class="back" href="editproduct.jsp" style="text-decoration:none">Back</a></h2>
<%
String id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where id='"+id+"'");
	while(rs.next())
	{
%>
<form action="editproductaction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id);%>">
<div class="div1">
		<h3>Enter Name</h3>
		<input class="addpr" type="text" name="name" value="<%=rs.getString(2) %>" required>
		
		<hr>
	</div>
	<div class="div1">
		<h3>Enter Category</h3>
		<input class="addpr" type="text" name="category" value="<%=rs.getString(3) %>" required>	
		<hr>
	</div>
	<div class="div1">
		<h3>Enter Price</h3>
		<input class="addpr" type="number" name="price" value="<%=rs.getString(4) %>" required>
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
<%	}
}catch(Exception e){System.out.println(e.getMessage());}
 %>
</body>
</html>