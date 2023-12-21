<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Gbook : Login</title>
<meta charset="ISO-8859-1">

<style type="text/css">
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

body {
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 20px;
	margin-top: 20px;
	background-color: black;
}

.container {
	position: relative;
	max-width: 400px;
	width: 100%;
	background-color: whitesmoke;
	padding: 25px;
	border-radius: 8px;
	margin-top: 30px;
}

.container .lgn-header {
	font-size: 2rem;
	color: #333;
	font-weight: 600;
	text-align: center;
}

.container .lgn-header .lgn-title {
	color: #1dca1dd7;
}

.container .form {
	margin-top: 30px;
}

.form .input-box {
	width: 100%;
	margin-top: 20px;
}

.input-box label {
	color: #333;
}

.form :where(.input-box input, .input, .select-box) {
	position: relative;
	height: 50px;
	width: 100%;
	outline: none;
	font-size: 1rem;
	color: #707070;
	margin-top: 8px;
	border: 1px solid #ddd;
	border-radius: 6px;
	padding: 0 15px;
}

.input-box input:focus, .input:focus {
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}

.form .column {
	display: flex;
	column-gap: 15px;
}

.form button {
	height: 55px;
	width: 100%;
	color: #1dca1dd7;
	font-size: 16px;
	font-weight: 500;
	margin-top: 30px;
	border: none;
	cursor: pointer;
	transition: all 0.2s ease;
	background-color: black;
}

.form button:hover {
	background-color: #1dca1dd7;
	color: black;
}

.redirect {
	padding-left: 21%;
	padding-top: 2%;
}

.bottomForgotLink {
	padding-left: 5%;
}

/*Responsive*/
@media screen and (max-width: 500px) {
	.form .column {
		flex-wrap: wrap;
	}
	.form :where(.gender-option, .gender) {
		row-gap: 15px;
	}
}
</style>

</head>
<body>
	<%@include file="nav.jsp"%>

	<%
	String lgnfmsg = (String) session.getAttribute("failedMessage");

	if (lgnfmsg != null) {
	%>
	<script>
		alert("Login Failed");
	</script>
	<%
	}
	session.removeAttribute("failedMessage");
	%>

	<%
	String regSucMsg = (String) session.getAttribute("succRegMsg");

	if (regSucMsg != null) {
	%>
	<script>
		alert("Register Successfull");
	</script>
	<%
	}
	session.removeAttribute("succRegMsg");
	%>

	<%
	String editProfileMsg = (String) session.getAttribute("succEditProfileMsg");

	if (editProfileMsg != null) {
	%>
	<script>
		alert("Profile Edit Successfully");
	</script>
	<%
	}
	session.removeAttribute("succEditProfileMsg");
	%>

	<br>
	<div class="container">
		<header class="lgn-header">
			<span class="lgn-title">L</span>ogin
		</header>

		<form action="../login" method="post" class="form">

			<!-- 	<div class="input-box">
				<label>Type</label> <select name="userType" class="input">
					<option value="user" name="userType">User</option>
					<option value="owner" name="userType">Umpire</option>
					<option value="umpire" name="userType">Owner</option>
				</select>
			</div> -->
			<div class="input-box">
				<label>Email Address</label> <input type="email"
					placeholder="Enter email address" name="email" required />
			</div>
			<div class="input-box">
				<label>Password</label> <input type="password"
					placeholder="Enter Password" name="password" required />
			</div>
			<button>Submit</button>
			<div class="bottomLink">
				<p class="redirect">
					New at this site? <a href="userRegister.jsp">Register</a>
			</div>


			<div class="bottomForgotLink">
				<p class="redirect">
					<!--<a href="forgotPassword.jsp">Forgotten password?</a>-->
			</div>
		</form>
	</div>
</body>
</html>