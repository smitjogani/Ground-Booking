<%@page import="com.entity.Grounds"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.GroundDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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
	height: 70vh;
	width: 100%;
	background-color: whitesmoke;
	transition: ease 0.3s;
}

.ground {
	height: 70vh;
	width: 100%;
}

.ground .ground-bg {
	width: 100%;
	height: 40vh;
	display: flex;
}

.ground .ground-bg img {
	height: 70vh;
	width: 100vw;
	object-fit: cover;
}

.ground-data {
	display: flex;
	margin-top: -10vh;
	color: whitesmoke;
	font-size: 3vw;
	padding: 1vw;
	margin-left: 12vw;
	width: 35vw;
}

.ground-data h1 {
	font-size: 4vh;
}

.ground-data span {
	color: #1dca1dd7;
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
	width: 270px;
	height: 500px;
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
	font-size: 1rem;
	text-decoration: none;
}

.card-content .card-btn:hover {
	background-color: #1dca1dd7;
	transition: 0.3s ease;
	color: black;
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
	.footer {
		top: 100%;
	}
}
</style>

</head>
<body>
	<%@include file="nav.jsp"%>

	<%
	String sltBkMsg = (String) session.getAttribute("sucBookMsg");

	if (sltBkMsg != null) {
	%>
	<script>
		alert("Slot Booking Successfully");
	</script>
	<%
	}
	session.removeAttribute("sucBookMsg");
	%>

	<div class="ground-main">
		<div class="ground">
			<div class="ground-bg">
				<img src="Image/gbg.jpg" alt="" />
			</div>
			<div class="ground-data">
				<h1>
					Make Your <span>Own Space </span>to Play Sports Era.
				</h1>
			</div>
		</div>
		<div class="boxes">
			<div class="card-container">

				<%
				GroundDAOImpl dao = new GroundDAOImpl(DBConnect.getConn());
				List<Grounds> list = dao.getAllGrounds();
				//out.print(list);
				for (Grounds g : list) {
				%>

				<div class="card">
					<img src="../img/<%=g.getGroundPicture()%>" alt="" />
					<div class="card-content">
						<h3><%=g.getGroundName()%></h3>
						<h4><%=g.getGroundAdd()%></h4>
						<h4><%=g.getGroundCity()%></h4>
						<h4><%=g.getGroundState()%></h4>
						<h4>
							Rs.<%=g.getGroundPrice()%>/Slots
						</h4>
						<a class="card-btn"
							href="bookingToggle.jsp?id=<%=g.getGroundId()%>">Book Now</a>

					</div>
				</div>

				<%
				}
				%>


				<!-- <div class="card">
					<img src="Image/Crikfut2.jpeg" alt="" />
					<div class="card-content">
						<h3>Ground-Name</h3>
						<h4>ADD</h4>
						<h4>city</h4>
						<h4>State</h4>
						<h4>Rs.2000/Slots</h4>
						<a class="card-btn" href="bookingToggle.jsp">Book Now</a>

					</div>
				</div>

				<div class="card">
					<img src="Image/Crikfut2.jpeg" alt="" />
					<div class="card-content">
						<h3>Ground-Name</h3>
						<h4>ADD</h4>
						<h4>city</h4>
						<h4>State</h4>
						<h4>Rs.2000/Slots</h4>
						<a class="card-btn" href="bookingToggle.jsp">Book Now</a>
					</div>
				</div>

				<div class="card">
					<img src="Image/Crikfut2.jpeg" alt="" />
					<div class="card-content">
						<h3>Ground-Name</h3>
						<h4>ADD</h4>
						<h4>city</h4>
						<h4>State</h4>
						<h4>Rs.2000/Slots</h4>
						<a class="card-btn" href="bookingToggle.jsp">Book Now</a>
					</div>
				</div>

				<div class="card">
					<img src="Image/Crikfut2.jpeg" alt="" />
					<div class="card-content">
						<h3>Ground-Name</h3>
						<h4>ADD</h4>
						<h4>city</h4>
						<h4>State</h4>
						<h4>Rs.2000/Slots</h4>
						<a class="card-btn" href="bookingToggle.jsp">Book Now</a>
					</div>
				</div>-->

			</div>
		</div>

		<div class="footer">
			<%@include file="/components/footer.jsp"%>
		</div>
	</div>
</body>
</html>
</html>