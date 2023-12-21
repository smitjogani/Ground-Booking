<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />

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

.dashHeader {
	width: 100%;
	background-color: black;
	display: flex;
	justify-content: space-between;
}

.nav {
	width: 100%;
	margin: 5px;
	display: flex;
	justify-content: space-between;
}

.nav .logo {
	color: #fff;
	padding: 5px 10px;
	font-size: 1.5em;
	font-weight: 600;
	text-decoration: none;
}

.nav .logo span {
	color: #1dca1dd7;
	padding-right: 2px;
	font-size: 1.8rem;
	font-weight: 400;
}

.nav .menu-btn {
	color: whitesmoke;
	background-position: center;
	font-size: 34px;
	width: 40px;
	height: 40px;
	cursor: pointer;
	transition: 0.3s ease;
	display: block;
}

.navlinkes.active {
	list-style: none;
	display: flex;
	align-items: center;
	flex-direction: column;
	position: absolute;
	width: 30%;
	background-color: black;
	height: 89.93%;
	top: 10.1%;
	left: 70%;
	z-index: 99;
	margin-top: -1%;
}

.navlinkes {
	display: none;
}

.navlinkes li {
	padding: 15px;
	width: 100%;
	display: flex;
	justify-content: center;
	transition: 2s ease;
}

.navlinkes li:hover {
	background-color: #1dca1d86;
}

.navlinkes li a {
	text-decoration: none;
	color: white;
}

@media ( max-width : 1040px) {
	.navlinkes.active {
		top: 3%;
		margin-top: 5%;
		height: 100vh;
	}
}
</style>

</head>
<body>
	<div class="mainDash">
		<header class="dashHeader">
			<div class="nav">
				<a class="logo" href="main.jsp"><span>G</span>book</a>
				<ul class="navlinkes" id="navLinks">
					<li><a href="main.jsp">Dashboard</a></li>
					<li><a href="oGround.jsp">Grounds</a></li>
					<li><a href="oBoxes.jsp">Boxes</a></li>
					<li><a href="addGrounds.jsp">Add Ground</a></li>
					<li><a href="addBoxes.jsp">Add Boxes</a></li>
					<!-- <li><a href="addsloat.jsp">Add Slots</a></li> -->
					<li><a href="Profile.jsp">Profile</a></li>
					<li><a href="../ownerLogout">Logout</a></li>
				</ul>
				<div class="toggle-btn menu-btn" id="toggleButton">
					<i class="fa-solid fa-bars"></i>
				</div>
			</div>
		</header>
	</div>
	<script type="text/javascript">
		const toggleButton = document.getElementById('toggleButton');
		const navLinks = document.getElementById('navLinks');
		
		toggleButton.addEventListener('click',() => {
			navLinks.classList.toggle('active');
		});
	</script>
</body>
</html>