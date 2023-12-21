<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gbook</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="/components/style.css">

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<%
		String msg = (String)session.getAttribute("notAvalableMsg");
	
		if(msg != null)
		{%>
		<script>alert("Slot is already Booked");</script>	
		<%}
		session.removeAttribute("notAvalableMsg");
	%>
	<%
		String lgnmsg = (String)session.getAttribute("Message");
	
	if(lgnmsg != null)
	{%>
			<script>alert("Login Successfully");</script>
	<%}
	session.removeAttribute("Message");
	%>
	<div class="bodyMain">
		<section class="home">
			<div class="content" data-scroll data-scroll-speed="-5">
				<h1>
					YOUR NEAREST SPORTS <span> PLACE</span>
				</h1>
				<p>IS JUST A TAP AWAY</p>
				<a class="btn book-btn" href="Pages/ground.jsp">Book Now</a>
			</div>
			<video class="video-slide" src="img/bg2.mp4" autoplay muted loop></video>
		</section>
		<section class="feature">
			<div class="main-feature">
				<div class="box">
					<div class="logo">
						<img width="60" height="60" src="img/map.png" alt="map-marker" />
					</div>
					<div class="title">Search</div>
					<div class="para">Are you looking to play after work,
						organize your Sunday Five's football match? Explore the largest
						network of sports facilities whole over the India</div>
				</div>

				<div class="box">
					<div class="logo">
						<img width="60" height="60" src="img/cal.png" alt="calendar--v1" />
					</div>
					<div class="title">Book</div>
					<div class="para">Once you have found the perfect ground,
						court or gym, Connect with the venue through the Book Now Button
						to make online booking and secure easier payment</div>
				</div>

				<div class="box">
					<div class="logo">
						<img width="60" height="60" src="img/cricket.png" alt="cricket" />
					</div>
					<div class="title">Play</div>
					<div class="para">You are the hero, you have found a stunning
						turf or court, booked with ease and now its time to play. The
						scene is set for your epic match.</div>
				</div>
			</div>
		</section>
		<div class="footer">
			<%@include file="components/footer.jsp"%>
		</div>
	</div>
</body>
</html>