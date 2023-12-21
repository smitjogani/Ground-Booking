package com.umpire.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/umpireLogout")
public class LogoutUmpire extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
			session.removeAttribute("unmpireObj");
			
			session.setAttribute("succMsg","Logout Successfully");
			resp.sendRedirect("Pages/login.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
