<%@page import="com.entity.Grounds"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.GroundDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Grounds : Edit Details</title>

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
			int id = Integer.parseInt(request.getParameter("id"));
			GroundDAOImpl dao = new GroundDAOImpl(DBConnect.getConn());
			Grounds g = dao.getGroundbyId(id);
		%>
		
			<form action="../updateGroundDetails" method="post">
				<h3>
					<span>E</span>dit <span>G</span>round <span>D</span>etails
				</h3>
				<input type="hidden" name="groundId" class="box" value="<%=g.getGroundId()%>">
				<input type="text" placeholder="Enter Ground Name" name="groundName" class="box" value="<%=g.getGroundName()%>" required>
				<input type="text" placeholder="Enter Address" name="groundAddress" class="box" value="<%=g.getGroundAdd()%>" required>
				<input type="text" placeholder="Enter City" name="groundCity" class="box" value="<%=g.getGroundCity()%>" required>
				<input type="text" placeholder="Enter State" name="groundState" class="box" value="<%=g.getGroundState()%>" required>
				<input type="number" placeholder="Enter Charge" name="groundCharge" class="box" value="<%=g.getGroundPrice()%>" required>
				<!-- <input type="file" value="Upload Image" name="groundImage" class="box"> -->
				<input type="submit" class="addBtn" value="Update">
			</form>
		</div>
	</div>


</body>
</html>