<%@page import="com.entity.Owner"%>
<%@page import="com.entity.Boxes"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BoxDAOImpl"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard : Boxes</title>

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
}

.boxes {
	background-color: whitesmoke;
	display: flex;
	flex-direction: column;
}

.card-container {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	width: 100%;
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
	margin-top: 15px;
	border: 1px solid transparent;
	border-radius: 6%;
	cursor: pointer;
	text-decoration: none;
}

.btn-container {
	padding-bottom: 20px;
	padding-top: 5px;
	margin: 5px;
}

.card-content .card-btn:hover {
	background-color: #1dca1dd7;
	transition: 0.3s ease;
	color: black;
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
	String succEditBoxMsg = (String) session.getAttribute("succEditBoxMsg");

	if (succEditBoxMsg != null) {
	%>
	<script>
		alert("Box Edit Successfully");
	</script>
	<%
	}
	session.removeAttribute("succEditBoxMsg");
	%>

	<%
	String addBoxMsg = (String) session.getAttribute("addBoxSuccMsg");

	if (addBoxMsg != null) {
	%>
	<script>
		alert("Box Added Successfully");
	</script>
	<%
	}
	session.removeAttribute("addBoxSuccMsg");
	%>

	<%
	String succAddBoxSlotMsg = (String) session.getAttribute("succAddBoxSlotMsg");

	if (succAddBoxSlotMsg != null) {
	%>
	<script>
		alert("Slot Added Successfully");
	</script>
	<%
	}
	session.removeAttribute("succAddBoxSlotMsg");
	%>

	<div class="ground-main">
		<%
		Owner owner = (Owner) session.getAttribute("ownerobj");
		if (owner == null) {
			response.sendRedirect("../Pages/login.jsp");
		} else {

			int id = owner.getId();

			BoxDAOImpl dao = new BoxDAOImpl(DBConnect.getConn());
			List<Boxes> bli = dao.getBoxsById(id);

			//out.print(bli);
			for (Boxes b : bli) {
		%>

		<div class="boxes">
			<div class="card-container">
				<div class="card">
					<img src="../img/<%=b.getBoxPicture()%>" alt="" />
					<div class="card-content">
						<h3><%=b.getBoxName()%></h3>
						<h4><%=b.getBoxAdd()%></h4>
						<h4><%=b.getBoxCity()%>,<%=b.getBoxState()%></h4>
						<h4>
							₹<%=b.getBoxPrice()%>/Sloat
						</h4>
						<div class="btn-container">
							<a class="card-btn edit-btn"
								href="editBoxDetails.jsp?id=<%=b.getBoxId()%>">Edit</a> <a
								class="card-btn edit-btn"
								href="addsloatb.jsp?id=<%=b.getBoxId()%>">Add Slot</a> <a
								class="card-btn delete-btn"
								href="../deleteBox?id=<%=b.getBoxId()%>">Delete</a>
						</div>
					</div>
				</div>

				<%
				}
				}
				%>

				<!--<div class="card">
					<img src="Image/a2.jpeg" alt="" />
					<div class="card-content">
						<h3>Box-Name</h3>
						<div class="btn-container">
							<a class="card-btn edit-btn" href="editBoxDetails.jsp">Edit</a> <a
								class="card-btn edit-btn" href="addsloatb.jsp">Add Sloat</a> <a
								class="card-btn delete-btn" href="">Delete</a>
						</div>
					</div>
				</div>

				<div class="card">
					<img src="Image/a4.jpeg" alt="" />
					<div class="card-content">
						<h3>Box-Name</h3>
						<div class="btn-container">
							<a class="card-btn edit-btn" href="editBoxDetails.jsp">Edit</a> <a
								class="card-btn edit-btn" href="addSloatb.jsp">Add Sloat</a> <a
								class="card-btn delete-btn" href="">Delete</a>
						</div>
					</div>
				</div>

				<div class="card">
					<img src="Image/a6.jpeg" alt="" />
					<div class="card-content">
						<h3>Box-Name</h3>
						<div class="btn-container">
							<a class="card-btn edit-btn" href="editBoxDetails.jsp">Edit</a> <a
								class="card-btn edit-btn" href="addSloatb.jsp">Add Sloat</a> <a
								class="card-btn delete-btn" href="">Delete</a>
						</div>
					</div>
				</div>-->

			</div>
		</div>
	</div>
</body>
</html>