<%@page import="com.entity.Sloatb"%>
<%@page import="com.DAO.SloatbDAOImpl"%>
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
<title>Dashboard</title>

<style>
@import
	url("https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&family=Poppins:ital,wght@0,100;0,300;0,500;0,600;0,700;1,300;1,600&family=Roboto:wght@400;500;700;900&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

main {
	width: 100vw;
	background-color: #fff;
	padding: 1.6vw;
}

main .table {
	height: 90vh;
	border-radius: .8rem;
	z-index: 1;
}

.table_container {
	display: flex;
}

.table_body {
	overflow: scroll;
	width: 50%;
	height: 100%;
}

.tableHeader {
	width: 100vw;
	height: 10%;
	background-color: #f5f5f5;
	padding: .8rem 1rem;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.tableHeader h1 {
	font-weight: 500;
}

.tableHeader h1 span {
	color: #1dca1d86;
}

.tableHeader .input-group {
	width: 25%;
	height: 100%;
	background-color: white;
	padding: .5rem .8rem;
	border-radius: 2rem;
	display: flex;
	justify-content: center;
	align-items: center;
	transition: .2s;
}

.tableHeader .input-group:hover {
	width: 30%;
	font-size: 16px;
	background-color: #fff8;
	box-shadow: 0 .1rem .4rem #0002;
	background-color: #fff8;
}

.tableHeader .input-group input {
	width: 100%;
	padding: 0 .5rem 0 .3rem;
	background-color: transparent;
	border: none;
	outline: none;
}

.tableHeader {
	width: 100%;
	max-height: calc(89% - 1.6rem);
	background-color: #f5f5f5;
	margin: .8rem auto;
	border-radius: .6rem;
	overflow: auto;
	overflow: overlay;
}

table {
	width: 100%;
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

@media ( max-width : 1000px) {
	td:not(:first-of-type) {
		min-width: 12.1rem;
	}
}
</style>

</head>
<body>
	<%@include file="nav.jsp"%>

	<%
	String lgnmsg = (String) session.getAttribute("Message");

	if (lgnmsg != null) {
	%>
	<script>
		alert("Login Successfully");
	</script>
	<%
	}
	session.removeAttribute("Message");
	%>
	
	<%
	String addBoxFailedMsg = (String) session.getAttribute("addBoxFailedMsg");

	if (addBoxFailedMsg != null) {
	%>
	<script>
		alert("Box Adding Fail");
	</script>
	<%
	}
	session.removeAttribute("addBoxFailedMsg");
	%>
	
	<%
	String failAddBoxSlotMsg = (String) session.getAttribute("failAddBoxSlotMsg");

	if (failAddBoxSlotMsg != null) {
	%>
	<script>
		alert("Slot Adding Failed");
	</script>
	<%
	}
	session.removeAttribute("failAddBoxSlotMsg");
	%>
	
	
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
	

	<%
	Owner owner = (Owner) session.getAttribute("ownerobj");
	if (owner == null) {
		response.sendRedirect("../Pages/login.jsp");
	} else {

		SloatgDAOImpl dao = new SloatgDAOImpl(DBConnect.getConn());
		int id = owner.getId();
		List<Sloatg> sg = dao.getSlots(id);
		//out.println(sg);
		int index = 1;
	%>
	<div class="table">
		<div class="tableHeader">
			<h1>
				<span>B</span>ookings
			</h1>
		</div>
		<div class="table_container">
			<div class="table_body">
				<table>
					<thead>
						<tr>
							<th>No</th>
							<th>Type</th>
							<th>Ground ID</th>
							<th>User ID</th>
							<th>Booking Date</th>
							<th>Booking Time</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<%
							for (Sloatg g : sg) {
							%>
							<td><%=index%></td>
							<td>Ground</td>
							<td><%=g.getSloatGroundId()%></td>
							<td><%=g.getUserId()%></td>
							<td><%=g.getDate()%></td>
							<td><%=g.getSloatTime()%></td>
						</tr>
						<%
						index++;
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="table_body">
				<table>
					<thead>
						<%
						SloatbDAOImpl daob = new SloatbDAOImpl(DBConnect.getConn());
						List<Sloatb> b = daob.getBoxSlotes(id);
						int bno = 1;
						%>
						<tr>
							<th>No</th>
							<th>Type</th>
							<th>Ground ID</th>
							<th>User ID</th>
							<th>Booking Date</th>
							<th>Booking Time</th>
						</tr>
					</thead>

					<tbody>
						<%
						for (Sloatb slb : b) {
						%>
						<tr>
							<td><%=bno%></td>
							<td>Box</td>
							<td><%=slb.getSloatBoxId()%></td>
							<td><%=slb.getUserId()%></td>
							<td><%=slb.getDate()%></td>
							<td><%=slb.getSloatTIme()%></td>
						</tr>
						<%
						bno++;
						}
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>