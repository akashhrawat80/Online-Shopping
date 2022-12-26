<%@page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<style>
	body{
		font-family:Arial,Helvetica;
		background-color:lightblue;
	}
	.navigationbar{
		overflow:hidden;
		background-color:#333;
	}
	.navigationbar a{
		float:left;
		color:#f2f2f2;
		text-align:center;
		padding:14px 16px;
		text-decoration:none;
		font-size:17px;
	}
	.navigationbar a:hover{
		backgorund-color:#ddd;
		color:black;
	}
	.navigationbar a.active{
		background-color:#04AA6D;
		color:white;
	}
	#welcome{
		margin:auto;
	}
</style>

</head>
<body>
<h1 style="padding-left:380px;">eShopping</h1>
	<div class="navigationbar">
		<%String email=session.getAttribute("email").toString(); %>
		<nav>
		<a class="active" href="addnewproduct.jsp">Add New Product</a>
		<a href="editproduct.jsp">Edit products</a>
		<a href="">Orders Received</a>
		<a href="">Orders Cancelled</a>
		<a href="">Delivered Orders</a>
		<a href="../logout.jsp">LogOut</a>
		</nav>
	</div>
</body>
</html>