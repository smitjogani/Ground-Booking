<%@page import="java.time.LocalDate"%>
<%@page import="com.entity.Sloatg"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.SloatgDAOImpl"%>
<%@page import="com.entity.Owner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DashBoard: Add Slots</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

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

form {
	max-width: 50rem;
	margin: 0 auto;
	padding: 2rem;
	border-radius: .5rem;
	background-color: #f5f5f5;
}

form h3 {
	color: black;
	margin-bottom: 1rem;
	text-align: center;
	font-size: 1.9rem
}

form h4 {
	font-weight: 400;
	font-size: 20px;
}

form h2 {
	font-size: 30px;
	padding-bottom: 20px;
}

form h2 span {
	color: #1dca1dd7;
}

form h3 span {
	color: #1dca1dd7;
}

form .box {
	width: 100%;
	border-radius: 0.5rem;
	padding: .8rem 1rem;
	font-size: 1.3rem;
	margin: 1rem 0;
	background-color: white;
}

form .box:focus {
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

.delete-btn {
	color: red;
	font-size: 14px;
	background-color: black;
	padding: 6px 13px;
	margin-top: 20px;
	border: 1px solid transparent;
	border-radius: 6%;
	cursor: pointer;
	text-decoration: none;
}

.delete-btn:hover {
	background-color: red;
	color: black;
}

.addBtn:hover {
	background-color: #1dca1dd7;
	color: black;
}

table {
	width: 100%;
	margin-bottom: 10px;
}

table, th, td {
	border-collapse: collapse;
	padding: 1rem;
	text-align: left;
}

thead th {
	position: sticky;
	top: 0;
	left: 0;
	background-color: #1dca1d3d;
	cursor: pointer;
	text-transform: capitalize;
	cursor: pointer;
}
</style>

</head>
<body>
	<%@include file="nav.jsp"%>
	
	<%
	String groundSlotFailedMsg = (String) session.getAttribute("groundSlotFailedMsg");

	if (groundSlotFailedMsg != null) {
	%>
	<script>
		alert("Slot Adding Failed");
	</script>
	<%
	}
	session.removeAttribute("groundSlotFailedMsg");
	%>
	
	<div class="container">

		<%
		Owner owner = (Owner) session.getAttribute("ownerobj");
		if (owner == null) {
			response.sendRedirect("../Pages/login.jsp");
		} else {
			int gid = Integer.parseInt(request.getParameter("id"));
		%>

		<form action="../addSloatg" method="post" class="slots">
			<h2>
				<span>A</span>dd <span>S</span>lots
			</h2>

			<input type="hidden" name="groundOwnerId" class="box" value="<%=owner.getId()%>" required>
			<input type="hidden" name="groundId" class="box" value="<%=gid%>" required>
			<h4>Date</h4>
			<input type="date" name="Dateg" class="box"
				min="<%=LocalDate.now()%>" max="<%=LocalDate.now()%>"
				required>
			<h4>Starting Time</h4>
			<input type="time" name="startTimeg" class="box" required>
			<h4>Ending Time</h4>
			<input type="time" name="endTimeg" class="box" required> <input
				type="submit" class="addBtn" name="addBox" value="Add Sloat">
		</form>
	</div>

	<div>
		<table>
			<thead>
				<tr>
					<th>No</th>
					<th>Slot Added Date</th>
					<th>Slot Time</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<%
				SloatgDAOImpl dao = new SloatgDAOImpl(DBConnect.getConn());
				//out.println(gid);
				List<Sloatg> stg = dao.getSlotsById(gid);
				int index = 1;
				for (Sloatg gs : stg) {
				%>
				<tr>
					<td><%=index%></td>
					<td><%=gs.getDate()%></td>
					<td><%=gs.getTimeFrom()%> to <%=gs.getTimeTo()%></td>
					
				</tr>
				<%
				index++;
				}
				%>
			</tbody>
		</table>
	</div>

	<%
	}
	%>
</body>
</html>

