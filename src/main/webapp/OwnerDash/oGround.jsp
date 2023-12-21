<%@page import="com.entity.Grounds"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Owner"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.GroundDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard : Grounds</title>

<style type="text/css">
@import
	url("https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&family=Poppins:ital,wght@0,100;0,300;0,500;0,600;0,700;1,300;1,600&family=Roboto:wght@400;500;700;900&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

.ground-main {
	padding: 0;
	margin: 0;
	height: 100vh;
	width: 100%;
	background-color: whitesmoke;
	transition: ease 0.3s;
	display: flex;
	flex-wrap: wrap;
}

.boxes {
	background-color: whitesmoke;
	display: flex;
}

.card-container {
	display: flex;
	flex-wrap: wrap;
}

.card {
	width: 300px;
	height: 400px;
	background-color: whitesmoke;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
	margin: 20px;
	padding-bottom: 18px;
}

.card img {
	width: 100%;
	height: 60%;
	object-fit: cover;
	opacity: 1;
}

.card-content {
	padding: 12px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.card-content h3 {
	font-size: 3.5vh;
	font-weight: 600;
	margin-bottom: 2px;
}

.card-content h4 {
	color: black;
	opacity: 0.9;
}

.card-content .card-btn {
	background-color: black;
	color: #1dca1dd7;
	padding: 6px 13px;
	margin-top: 20px;
	border: 1px solid transparent;
	border-radius: 6%;
	cursor: pointer;
	text-decoration: none;
}

.card-content .card-btn:hover {
	background-color: #1dca1dd7;
	transition: 0.3s ease;
	color: black;
}

.btn-container {
	padding-bottom: 20px;
	padding-top: 5px;
	margin: 5px;
}

.card-content .edit-btn {
	font-size: 14px;
}

.card-content .delete-btn {
	color: red;
	font-size: 14px;
}

.card-content .delete-btn:hover {
	background-color: red;
}

@media ( max-width : 1040px) {
	.ground-main {
		height: 100vh;
	}
	.ground-data {
		width: 33vh;
	}
	.card-content h3 {
		font-size: 1.5vh;
	}
}
</style>

</head>
<body>
	<%@include file="nav.jsp"%>

	<%
	String editGroundSuccMsg = (String) session.getAttribute("editGroundSuccMsg");

	if (editGroundSuccMsg != null) {
	%>
	<script>
		alert("Ground Edit Successfully");
	</script>
	<%
	}
	session.removeAttribute("editGroundSuccMsg");
	%>

	<%
	String succGroundAddMsg = (String) session.getAttribute("succGroundAddMsg");

	if (succGroundAddMsg != null) {
	%>
	<script>
		alert("Ground Added Successfully");
	</script>
	<%
	}
	session.removeAttribute("succGroundAddMsg");
	%>

	<%
	String groundSlotSuccMsg = (String) session.getAttribute("groundSlotSuccMsg");

	if (groundSlotSuccMsg != null) {
	%>
	<script>
		alert("Slot Added Successfully");
	</script>
	<%
	}
	session.removeAttribute("groundSlotSuccMsg");
	%>

	<div class="ground-main">
		<%
		Owner owner = (Owner) session.getAttribute("ownerobj");

		if (owner == null) {
			response.sendRedirect("../Pages/login.jsp");
		} else {

			int id = owner.getId();

			GroundDAOImpl dao = new GroundDAOImpl(DBConnect.getConn());
			List<Grounds> gli = dao.getGroundsById(id);

			//out.print(gli);
			for (Grounds g : gli) {
		%>

		<div class="boxes">
			<div class="card-container">
				<div class="card">
					<img src="../img/<%=g.getGroundPicture()%>" alt="" />
					<div class="card-content">
						<h3><%=g.getGroundName()%></h3>
						<h4><%=g.getGroundAdd()%></h4>
						<h4><%=g.getGroundCity()%>,<%=g.getGroundState()%></h4>
						<h4>
							₹<%=g.getGroundPrice()%>/Sloat
						</h4>
						<div class="btn-container">
							<a class="card-btn edit-btn"
								href="editGroundDetails.jsp?id=<%=g.getGroundId()%>">Edit</a> <a
								class="card-btn edit-btn"
								href="addsloatg.jsp?id=<%=g.getGroundId()%>">Add Sloat</a> <a
								class="card-btn delete-btn"
								href="../deleteGround?id=<%=g.getGroundId()%>">Delete</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>
				<!-- <div class="card">
					<img src="Image/Crikfut2.jpeg" alt="" />
					<div class="card-content">
						<h3>Ground-Name</h3>
						<div class="btn-container">
							<a class="card-btn edit-btn" href="editGroundDetails.jsp">Edit</a>
							<a class="card-btn edit-btn" href="addsloatg.jsp">Add Sloat</a> <a
								class="card-btn delete-btn" href="">Delete</a>
						</div>
					</div>
				</div>

				<div class="card">
					<img src="Image/d.png" alt="" />
					<div class="card-content">
						<h3>Ground-Name</h3>
						<div class="btn-container">
							<a class="card-btn edit-btn" href="editGroundDetails.jsp">Edit</a>
							<a class="card-btn edit-btn" href="addsloatg.jsp">Add Sloat</a> <a
								class="card-btn delete-btn" href="">Delete</a>
						</div>
					</div>
				</div>

				<div class="card">
					<img src="Image/ForzaJPG.JPG" alt="" />
					<div class="card-content">
						<h3>Ground-Name</h3>
						<div class="btn-container">
							<a class="card-btn edit-btn" href="editGroundDetails.jsp">Edit</a>
							<a class="card-btn edit-btn" href="addsloatg.jsp">Add Sloat</a> <a
								class="card-btn delete-btn" href="">Delete</a>
						</div>
					</div>
				</div>

				<div class="card">
					<img src="Image/Crikfut2.jpeg" alt="" />
					<div class="card-content">
						<h3>Ground-Name</h3>
						<div class="btn-container">
							<a class="card-btn edit-btn" href="editGroundDetails.jsp">Edit</a>
							<a class="card-btn edit-btn" href="addsloatg.jsp">Add Sloat</a> <a
								class="card-btn delete-btn" href="">Delete</a>
						</div>
					</div>
				</div> -->
			</div>
		</div>
	</div>
</body>
</html>