<%@page import="com.entity.Umpire"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

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

.header {
	z-index: 999;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	display: flex;
	width: 100%;
	justify-content: space-between;
	align-items: center;
	transition: 0.5s ease;
	padding: 15px 170px;
	/*background-color: #000; */
}

.header.scrolled {
	background-color: #000;
}

.menu-btn {
	display: none;
}

.header .logo {
	color: #fff;
	font-size: 1.5em;
	font-weight: 600;
	text-decoration: none;
}

.header .logo span {
	color: #1dca1dd7;
	padding-right: 2px;
	font-size: 1.8rem;
	font-weight: 400;
}

.header .navigaction {
	position: relative;
}

.header .navigaction .nav-items .item {
	position: relative;
	color: #fff;
	font-size: 1em;
	margin: 11px;
	font-weight: 500;
	text-decoration: none;
	margin-left: 30px;
	transition: 0.3s ease;
}

.header .navigaction .nav-items .item:hover {
	color: #1dca1dd7;
}

.btn {
	background-color: #1dca1dd7;
	padding: 8px 15px;
	border: 1px solid transparent;
	border-radius: 6%;
	cursor: pointer;
}

.btn:hover {
	background-color: black;
	border: 1px solid #1dca1dd7;
	transition: 0.3s ease;
}

section {
	padding: 100px 200px;
	background-color: whitesmoke;
}

.userName{
	color: #1dca1dd7;
}

.iconU{
	color: #1dca1dd7;
	padding: 5px;
	font-size: 10px;
	border: 1px solid #1dca1dd7;
	border-radius: 50%;
	margin-left: 20px;
	margin-right:5px;
}

@media ( max-width : 1040px) {
	header {
		padding: 12px 20px;
	}
	section {
		padding: 100px 20px;
	}
	header .navigaction {
		display: none;
	}
	header .navigaction.active {
		position: fixed;
		width: 100%;
		top: 0;
		left: 0;
		height: 100vh;
		display: flex;
		justify-content: center;
		align-items: center;
		background: rgba(1, 1, 1, 0.9);
	}
	header .navigaction .nav-items .item {
		margin: 20px;
		font-size: 1.7rem;
		color: #fff;
	}
	header .navigaction.active .nav-items {
		background: #000;
		width: 100vw;
		max-width: 100vw;
		margin: 18px;
		padding: 30px;
		display: flex;
		flex-direction: column;
		align-items: center;
		border-radius: 5px;
		box-shadow: 0 5px 25px rgb(1 1 1/ 20%);
	}
	.menu-btn {
		color: whitesmoke;
		background-position: center;
		font-size: 30px;
		width: 40px;
		height: 40px;
		cursor: pointer;
		transition: 0.3s ease;
		display: block;
	}
	.menu-btn.active {
		z-index: 999;
		transform: rotate(360deg);
		transition: 0.3s ease-in-out;
	}
}
</style>

</head>
<body>

	<header class="header">
		<a class="logo" href="../index.jsp"><span>G</span>book</a>
		<div class="menu-btn">
			<i class="fa-solid fa-bars menu-btn"></i>
		</div>
		<div class="navigaction">
			<%
			User user = (User)session.getAttribute("userobj");
			Umpire umpire = (Umpire)session.getAttribute("unmpireObj");
		%>
			<div class="nav-items">
				<a class="item" href="../index.jsp">Home</a> <a class="item"
					href="ground.jsp">Grounds</a> <a class="item" href="boxes.jsp">Boxes</a>
				<a class="item" href="umpire.jsp">Umpires</a>

				<%
				if(user == null && umpire == null)
				{
				%>
				<a class="btn item" href="userRegister.jsp">Register</a>
				<a class="btn item" href="login.jsp">Login</a>
				<%
				}
				else if(umpire == null && user != null){
					%>
						<i class="fa-solid fa-user iconU"></i><label class="userName"><%=user.getName() %></label>
						<a class="btn item" href="../userLogout">Logout</a>
					<%
				}else if(user == null && umpire != null){
					%>
						<i class="fa-solid fa-user iconU"></i><label class="userName"><%=umpire.getName() %></label>
						<a class="btn item" href="../userLogout">Logout</a>
				  	<%
				}
				%>
			</div>
		</div>
	</header>

	<script type="text/javascript">
      const menuBtn = document.querySelector(".menu-btn");
      const navigate = document.querySelector(".navigaction");
      document.addEventListener('scroll', () => {
          const header = document.querySelector('header');

          if(window.scrollY > 10)
          {
            header.classList.add('scrolled');
          }
          else{
            header.classList.remove('scrolled')
          }
      })

      menuBtn.addEventListener("click", () => {
        menuBtn.classList.toggle("active");
        navigate.classList.toggle("active");
      });
    </script>

</body>
</html>
