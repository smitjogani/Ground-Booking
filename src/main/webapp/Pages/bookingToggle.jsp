<%@page import="java.time.LocalDate"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Sloatg"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.SloatgDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking</title>
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

.popup {
	position: absolute;
	top: 0;
	left: 50%;
	transform: translate(-50%, 50%);
	width: 450px;
	padding: 20px;
	background-color: #f5f5f5;
	border-radius: 10px;
	box-shadow: 0px 2px 5px 5px rgba(0, 0, 0, 0.1);
	transition: top 0ms ease-in-out 300ms, opacity 300ms ease-in-out,
		margin-top 300ms ease-in-out;
	width: 450px;
}

.popup form {
	width: 400px;
	padding: 5px;
}

.popup form>input {
	width: 100%;
	margin: 5px;
	border: none;
	padding: 10px;
	cursor: pointer;
}

.book-btn {
	background-color: black;
	color: white;
	padding: 6px 12px;
	border: 1px solid transparent;
	border-radius: .2rem;
	cursor: pointer;
}

.book-btn:hover {
	background-color: #1dca1dd7;
	border: 1px solid #1dca1dd7;
	transition: 0.3s ease;
	color: black;
}

.popup>* {
	margin: 15px 0;
}

.close-btn {
	position: absolute;
	top: -5px;
	right: 20px;
	width: 30px;
	height: 30px;
	border: none;
	outline: none;
	border-radius: 50%;
	cursor: pointer;
	text-decoration: none;
	color: black;
	font-size: 25px;
	font-weight: 500;
}

.close-btn:hover {
	color: #1dca1dd7;
}

.centered {
	width: 300px;
	margin: auto;
}

.unstyled {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

li {
	margin: 10px 0;
}
.note{
	display: flex;
	justify-content: center;
	align-items: center;
	color: red;
	font-size: 12px;
}
</style>

</head>
<body>

	<div class="popup" id="popup">
		<a href="ground.jsp" class="close-btn">X</a>
		<%
			
			User user = (User)session.getAttribute("userobj");
			
			if(user == null)
			{
				response.sendRedirect("login.jsp");
			}
			else{
				int id = Integer.parseInt(request.getParameter("id"));
			//out.print(id);
			//out.print(user.getId());
		%>
		<form action="../bookGroundSlot" method="post">
			Select Date : <input type="date" name="date" min="<%=LocalDate.now()%>" max="<%=LocalDate.now().plusDays(2) %>" required>
			<input type="hidden" name ="groundId" value="<%=id%>">
			<input type="hidden" name="userId" value="<%=user.getId() %>" required>
			
			<ul class="unstyled centered">
				<%
				SloatgDAOImpl dao = new SloatgDAOImpl(DBConnect.getConn());
				List<Sloatg> sli = dao.getSlotById(id);
				for (Sloatg g : sli) {
				%>
				
				<li>
					<input class="styled-checkbox" id="styled-checkbox-1" type="checkbox" name="sloatg" value="<%=g.getTimeFrom()%> <%=g.getTimeTo()%>"> 
					<label for="styled-checkbox-1"><%=g.getTimeFrom()%> to <%=g.getTimeTo()%></label>
					<input type="hidden" name="ownerId" value="<%=g.getSlotOwnerId()%>">
				</li>
				<%
				}
			}
				%>
			</ul>
				
			<input type="submit" value="Book Now" class="book-btn">
		</form>
		<p class="note">Non-cancellable</p>
	</div>

</body>
</html>