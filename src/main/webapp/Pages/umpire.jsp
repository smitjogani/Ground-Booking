<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.UmpireDAOImpl"%>
<%@page import="com.entity.Umpire"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"><%@include
	file="/components/allCss.jsp"%>

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

.umpire-main {
	height: 100%;
	width: 100%;
	transition: ease 0.3s;
	padding-top: 70px;
	background-color: #C7DCA7;
}

.umpire-container {
	display: flex;
	flex-direction: column;
}

.umpire-cards {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
}

.umpire-card {
	width: 240px;
	background-color: whitesmoke;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
	margin: 20px;
	transition: 0.3s ease;
}

.umpire-card img {
	width: 100%;
	height: 180px;
	object-fit: cover;
	background-size: cover;
}

.umpire-details {
	padding: 10px;
	display: flex;
	flex-direction: column;
	align-items: center;
	transition: 0.3s ease;
}

.umpire-name {
	font-size: 3vh;
	font-weight: 600;
	margin-bottom: 2px;
}

.info {
	/* margin-left: -10px; */
	padding-left: 12px;
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	cursor: pointer;
}

.info i {
	color: #000;
	padding-right: 10px;
	font-size: 15px;
}

.umpire-location {
	color: black;
	font-size: 14px;
	font-weight: 500;
	color: #1dca1dd7;
}

.umpire-email {
	color: black;
	font-size: 14px;
	font-weight: 500;
	color: #1dca1dd7;
}

.umpire-price {
	font-size: 15px;
	font-weight: 500;
	color: #1dca1dd7;
}

.umpire-no {
	font-size: 15px;
	color: #1dca1dd7;
	font-weight: 500;
}


</style>
<body>
	<div class="nav">
		<%@include file="nav.jsp"%>
	</div>
	<div class="umpire-main">
		<div class="umpire-container">
			<div class="umpire-cards">


				<%
				UmpireDAOImpl dao = new UmpireDAOImpl(DBConnect.getConn());
				List<Umpire> ulist = dao.getAllUmpire();

				for (Umpire u : ulist) {
				%>

				<div class="umpire-card">
					<img src="../img/<%=u.getPicture()%>" alt="" />
					<div class="umpire-details">
						<h3 class="umpire-name"><%=u.getName()%></h3>
						<div class="info">
							<h4 class="umpire-location">
								<i class="fa-solid fa-location-dot"></i>
								<%=u.getCity()%>,<%=u.getState()%>
							</h4>
							<h4 class="umpire-email">
								<i class="fa-solid fa-envelope"></i><%=u.getEmail()%>
							</h4>
							<h5 class="umpire-price">
								<i class="fa-solid fa-indian-rupee-sign"></i>
								<%=u.getCharge()%>/match
							</h5>
							<p class="umpire-no">
								<i class="fa-solid fa-phone"></i><%=u.getPhoneno()%>
							</p>
						</div>
					</div>
				</div>

				<%
				}
				%>


				<!--<div class="umpire-card">
					<img src="Image/m2.jpg" alt="" />
					<div class="umpire-details">
						<h3 class="umpire-name">Smit Jogani</h3>
						<div class="info">
							<h4 class="umpire-location">
								<i class="fa-solid fa-location-dot"></i>Pune
							</h4>
							<h5 class="umpire-price">
								<i class="fa-solid fa-indian-rupee-sign"></i>300/hour
							</h5>
							<p class="umpire-no">
								<i class="fa-solid fa-phone"></i>1234567890
							</p>
						</div>
					</div>
				</div>
				<div class="umpire-card">
					<img src="Image/m2.jpg" alt="" />
					<div class="umpire-details">
						<h3 class="umpire-name">Smit Jogani</h3>
						<div class="info">
							<h4 class="umpire-location">
								<i class="fa-solid fa-location-dot"></i>Pune
							</h4>
							<h5 class="umpire-price">
								<i class="fa-solid fa-indian-rupee-sign"></i>300/hour
							</h5>
							<p class="umpire-no">
								<i class="fa-solid fa-phone"></i>1234567890
							</p>
						</div>
					</div>
				</div>
				<div class="umpire-card">
					<img src="Image/m2.jpg" alt="" />
					<div class="umpire-details">
						<h3 class="umpire-name">Smit Jogani</h3>
						<div class="info">
							<h4 class="umpire-location">
								<i class="fa-solid fa-location-dot"></i>Pune
							</h4>
							<h5 class="umpire-price">
								<i class="fa-solid fa-indian-rupee-sign"></i>300/hour
							</h5>
							<p class="umpire-no">
								<i class="fa-solid fa-phone"></i>1234567890
							</p>
						</div>
					</div>
				</div>

				<div class="umpire-card">
					<img src="Image/m2.jpg" alt="" />
					<div class="umpire-details">
						<h3 class="umpire-name">Smit Jogani</h3>
						<div class="info">
							<h4 class="umpire-location">
								<i class="fa-solid fa-location-dot"></i> Place
							</h4>
							<h4 class="umpire-location">
								<i class="fa-solid fa-envelope"></i> Email
							</h4>
							<h5 class="umpire-price">
								<i class="fa-solid fa-indian-rupee-sign"></i> 300/hour
							</h5>
							<p class="umpire-no">
								<i class="fa-solid fa-phone"></i> 1234567890
							</p>
						</div>
					</div>
				</div>-->


			</div>
		</div>
	</div>
	
		<%@include file="/components/footer.jsp"%>
	
</body>
</html>