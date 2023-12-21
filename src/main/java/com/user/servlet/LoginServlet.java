package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import com.DAO.OwnerDAO;
import com.DAO.OwnerDAOImpl;
import com.DAO.UmpireDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Owner;
import com.entity.Umpire;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			OwnerDAOImpl odao = new OwnerDAOImpl(DBConnect.getConn());
			UmpireDAOImpl udao = new UmpireDAOImpl(DBConnect.getConn());

			HttpSession session = req.getSession();

			User us = dao.login(email, password);
			Owner ow = odao.login(email, password);
			Umpire ur = udao.login(email, password);

			if (us != null) {
				session.setAttribute("userobj", us);
				session.setAttribute("Message", "Successfully");
				resp.sendRedirect("index.jsp");
			} else if (ow != null) {
				session.setAttribute("ownerobj", ow);
				session.setAttribute("Message", "Successfully");
				resp.sendRedirect("OwnerDash/main.jsp");
			} else if (ur != null) {
				session.setAttribute("unmpireObj", ur);
				session.setAttribute("Message", "Successfully");
				resp.sendRedirect("index.jsp");
			} else {
				session.setAttribute("failedMessage", "Invalid email & password");
				resp.sendRedirect("Pages/login.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
