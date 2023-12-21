<%@page import="com.entity.Owner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard : Profile</title>

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

.container {
	width: 100%;
	min-height: 100vh;
	background: #f5f5f5;
	display: flex;
	align-items: center;
	justify-content: center;
}

.profileCard {
	width: 90%;
	max-width: 450px;
	text-align: center;
	background-color: white;
	color: black;
	border-radius: 2%;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
}

.profilePic {
	padding: 10px;
	height: 170px;
	width: 170px;
	object-fit: cover;
	border-radius: 50%;
}

.profileCard h1 {
	font-weight: 600;
	color: #1dca1dd7;
}

.profileCard h2 {
	font-weight: 500;
}

.profileCard h3 {
	font-weight: 400;
}

.editProfileBtn {
	cursor: pointer;
	display: inline-block;
	text-decoration: none;
	background-color: black;
	color: #1dca1dd7;
	width: 100%;
	margin-top: 20px;
	padding: 15px 0;
	display: inline-block;
}

.editProfileBtn:hover {
	color: black;
	background-color: #1dca1dd7;
}
</style>

</head>
<body>
	<%@include file="nav.jsp"%>

	<%
	String editProfilefmsg = (String) session.getAttribute("failEditProfileMsg");

	if (editProfilefmsg != null) {
	%>
	<script>
		alert("Something Wrong");
	</script>
	<%
	}
	session.removeAttribute("failedMessage");
	%>

	<div class="container">
		<%
		Owner owner = (Owner) session.getAttribute("ownerobj");
		if (owner == null) {
			response.sendRedirect("../Pages/login.jsp");
		} else {
		%>
		<div class="profileCard">
			<img alt="" src="../img/<%=owner.getPicture()%>" class="profilePic">
			<h1><%=owner.getName()%></h1>
			<h2><%=owner.getEmail()%></h2>
			<h2><%=owner.getPhoneno()%></h3>
				<h2><%=owner.getCity()%>,
					<%=owner.getState()%></h2>
				<a href="editProfile.jsp" class="editProfileBtn">Edit</a>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>