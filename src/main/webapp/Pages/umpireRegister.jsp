<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Gbook : Register</title>
<meta charset="ISO-8859-1">

<style>
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
	background-color: black;
}

.container {
	position: relative;
	max-width: 700px;
	width: 100%;
	background-color: whitesmoke;
	padding: 25px;
	border-radius: 8px;
	margin-top: 50px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.container header {
	font-size: 2rem;
	color: #333;
	font-weight: 600;
	text-align: center;
}

.container header span {
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

.form :where(.input-box input, .select-box) {
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

.input-box input:focus {
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}

.form .column {
	display: flex;
	column-gap: 15px;
}

.form .gender-box {
	margin-top: 20px;
}

.gender-box h3 {
	color: #333;
	font-size: 1rem;
	font-weight: 400;
	margin-bottom: 8px;
}

.form :where(.gender-option, .gender) {
	display: flex;
	align-items: center;
	column-gap: 50px;
	flex-wrap: wrap;
}

.form .gender {
	column-gap: 5px;
}

.gender input {
	accent-color: rgb(130, 106, 251);
}

.form :where(.gender input, .gender label) {
	cursor: pointer;
}

.gender label {
	color: #707070;
}

.address :where(input, .select-box) {
	margin-top: 15px;
}

.select-box select {
	height: 100%;
	width: 100%;
	outline: none;
	border: none;
	color: #707070;
	font-size: 1rem;
}

.form .button {
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

.form .button:hover {
	background-color: #1dca1dd7;
	color: black;
}

.redirect {
	padding-left: 30%;
	padding-top: 2%;
}

.refButtons {
	display: flex;
	justify-content: space-between;
	padding: 15px;
}

.refBtn {
	background-color: #1dca1dd7;
	padding: 8px 15px;
	font-weight: 500;
	border: 1px solid transparent;
	border-radius: 6%;
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.refBtn:hover {
	background-color: black;
	border: 1px solid #1dca1dd7;
	color: #1dca1dd7;
	transition: 0.3s ease;
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
	<%@include file="nav.jsp" %>
	<section class="container">
		<header>
			<span>U</span>mpire <span>R</span>egistration
		</header>
		<div class="refButtons">
			<a href="userRegister.jsp" class="userRefrence refBtn">User</a> <a
				href="ownerRegister.jsp" class="ownwerRefrence refBtn">Owner</a> <a
				href="umpireRegister.jsp" class="umpireRefrence refBtn">Umpire</a>
		</div>

		<form action="../umpireRegister" method="post" class="form"
			enctype="multipart/form-data">
			<div class="input-box">
				<label>Full Name</label> <input type="text" name="umpireName"
					placeholder="Enter full name" required />
			</div>
			<div class="input-box">
				<label>Email Address</label> <input type="email" name="umpireEmail"
					placeholder="Enter email address" required />
			</div>
			<div class="input-box">
				<label>Password</label> <input type="password" name="umpirePassword"
					placeholder="Enter Password" required />
			</div>
			<div class="column">
				<div class="input-box">
					<label>Phone Number</label> <input type="tel" name="umpirePhone"
						placeholder="Enter phone number" required />
				</div>
			</div>

			<div class="input-box">
				<label>City</label> <input type="text" placeholder="Enter your city"
					name="umpireCity" required />
			</div>
			<div class="input-box">
				<label>State</label> <input type="text" placeholder="Enter State"
					name="umpireState" required />
			</div>
			<div class="column">
				<div class="input-box">
					<label>Enter Your Charge</label> <input type="number" min='1'  max='5000'
						name="umpireCharge" placeholder="Enter Your Charge" required />
				</div>
			</div>
			<div class="gender-box">
				<h3>Gender</h3>
				<div class="gender-option">
					<div class="gender">
						<input type="radio" id="check-male" name="umpireGender"  value="Male"/>
						<label for="check-male">Male</label>
					</div>
					<div class="gender">
						<input type="radio" id="check-female" name="umpireGender" value="Female"/> <label
							for="check-female">Female</label>
					</div>
					<div class="gender">
						<input type="radio" id="check-other" name="umpireGender" value="Other"/> <label
							for="check-other">other</label>
					</div>
				</div>
			</div>
			<br>
			<div class="column">
				<div class="fileUpload">
					<label>Profile Picture</label><br> <input type="file"
						name="umpireImage" required />
				</div>
			</div>
			<input type="submit" value="Register" class="button">
			<div class="bottomLink">
				<p class="redirect">
					you are already registerd? <a href="login.jsp">Login</a>
			</div>
		</form>
	</section>

</body>
</html>