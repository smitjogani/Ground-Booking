<%@page import="com.entity.Boxes"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BoxDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Box : Edit Details</title>

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
				BoxDAOImpl dao = new BoxDAOImpl(DBConnect.getConn());
			    Boxes b = dao.getBoxById(id);
			%>
			
			<form action="../updateBoxDetails" method="post">
				<h3>
					<span>E</span>dit <span>B</span>ox <span>D</span>etails
				</h3>
					<input type="hidden" value="<%= b.getBoxId()%>" name="boxID" class="box">
					<input type="text" placeholder="Enter Box Name" name="boxName" class="box" value="<%=b.getBoxName() %>" required> 
					<input type="text" placeholder="Enter Address" name="boxAdd" class="box" value="<%=b.getBoxAdd() %>" required> 
					<input type="text" placeholder="Enter City" name="boxCity" class="box" value="<%=b.getBoxCity() %>" required> 
					<input type="text" placeholder="Enter State" name="boxState" class="box" value="<%=b.getBoxState() %>" required> 
					<input type="number" placeholder="Enter Charge" name="boxCharge" class="box" value="<%=b.getBoxPrice() %>" required>
					<!-- <input type="file"
					accept="image/png, image/jpg, image/jpeg" value="Upload Image"
					name="groundImage" class="box"> -->
				<input type="submit" class="addBtn" name="addGround" value="Edit">
			</form>
		</div>
	</div>

</body>
</html>