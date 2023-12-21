<%@page import="com.entity.Owner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard : Add Boxes</title>

<style type="text/css">
@import
	url("https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&family=Poppins:ital,wght@0,100;0,300;0,500;0,600;0,700;1,300;1,600&family=Roboto:wght@400;500;700;900&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
	outline: none;
	border: none;
	text-decoration: none;
	text-transform: capitalize;
}

.container {
	max-width: 1200px;
	padding: 2rem;
	margin: 0 auto;
}

.ground-product-form-container form {
	max-width: 50rem;
	margin: 0 auto;
	padding: 2rem;
	border-radius: .5rem;
	background-color: #f5f5f5;
}

.ground-product-form-container form h3 {
	color: black;
	margin-bottom: 1rem;
	text-align: center;
	font-size: 1.9rem
}

.ground-product-form-container form h3 span {
	color: #1dca1dd7;
}

.ground-product-form-container form h4 {
	font-weight: 400;
	font-size: 20px;
}

.ground-product-form-container form h2 {
	font-size: 26px;
	padding-bottom: 20px;
}

.ground-product-form-container form h2 span {
	color: #1dca1dd7;
}

.ground-product-form-container form .box {
	width: 100%;
	border-radius: 0.5rem;
	padding: .8rem 1rem;
	font-size: 1.3rem;
	margin: 1rem 0;
	background-color: white;
}

.ground-product-form-container form .box:focus {
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}

.addBtn {
	display: block;
	width: 100%;
	cursor: pointer;
	border-radius: .5rem;
	margin-top: 1rem;
	font-size: 1.3rem;
	padding: .8rem 1rem;
	color: #1dca1dd7;
	background-color: black;
	transition: all 0.2s ease;
}

.addBtn:hover {
	background-color: #1dca1dd7;
	color: black;
}
</style>

</head>
<body>
	<%@include file="nav.jsp"%>
	<div class="container">
		<div class="ground-product-form-container">
			
			<%
			Owner owner = (Owner) session.getAttribute("ownerobj");
			if(owner == null)
			{
				response.sendRedirect("../Pages/login.jsp");
			}
			else
			{
			%>
		
			<form action="../addBox" method="post" class="addBox"
				enctype="multipart/form-data">
				<h3>
					<span>A</span>dd <span>N</span>ew <span>B</span>ox
				</h3>
				
				
				<input type="hidden" name="boxOwnerId" class="box"
					value="<%=owner.getId()%>" required> <input type="text"
					placeholder="Enter Box Name" name="boxName" class="box" required>
				<input type="text" placeholder="Enter Address" name="boxAddress"
					class="box" required> <input type="text"
					placeholder="Enter City" name="boxCity" class="box" required>
				<input type="text" placeholder="Enter State" name="boxState"
					class="box" required> <input type="number" min='1' max='10000'
					placeholder="Enter Charge" name="boxCharge" class="box" required>
				<input type="file" name="boxImage" class="box" required> <input
					type="submit" class="addBtn" name="addBox" value="Add Box">
			</form>

		</div>
		<%} %>
	</div>
</body>
</html>