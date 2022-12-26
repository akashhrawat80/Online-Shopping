<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user</title>
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
</style>
</head>
<body>
	<h2>eShopping</h2>
	<div class="navigationbar">
	<%String email=session.getAttribute("email").toString(); %>
		<h2><a href=""><%out.println(email); %></a></h2>
		<a class="active" href="home.jsp">Home</a>
		<a href="cart.jsp">Cart</a>
		<a href="myorders.jsp">Orders</a>
		<a href="changedetails.jsp">Change Details</a>
		<a href="messageus.jsp">Message us</a>
		<a href="about.jsp">About</a>
		<a href="logout.jsp">Logout</a>
		<div class="search">
			<form action="searchhome.jsp" method="post">
				<input type="text" placeholder="search" name="search">
				<button type="submit">search</button>
			
			</form>
		</div>
	</div>
</body>
</html>