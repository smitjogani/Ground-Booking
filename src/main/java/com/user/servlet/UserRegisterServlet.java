package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userRegister")
public class UserRegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String name = req.getParameter("userName");
			String email = req.getParameter("userEmail");
			String password = req.getParameter("userPassword");
			String phoneno = req.getParameter("userPhone");
			String city = req.getParameter("userCity");
			String gender = req.getParameter("userGender");

//			System.out.println(name + " " + email + " " + password + " " + phoneno +" " + city + " " + gender);
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPassword(password);
			us.setPhoneno(phoneno);
			us.setCity(city);
			us.setGender(gender);

			String past = "select * from user where userEmail=?";
			Connection conn = DBConnect.getConn();
			PreparedStatement ps = conn.prepareStatement(past);
			ps.setString(1, email);

			HttpSession session = (HttpSession) req.getSession();
			ResultSet rs = ps.executeQuery();
			boolean userRegistered = false;

			while (rs.next()) {
				userRegistered = true;
			}

			if (!userRegistered) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				boolean f = dao.userRegister(us);

				if (f) {
					// System.out.println("User Register Successfully");
					session.setAttribute("succRegMsg", "User Registration Successfully");
					resp.sendRedirect("Pages/login.jsp");
				} else {
					// System.out.println("Somthig wrong");
					session.setAttribute("failedRegMsg", "User Registration Fail");
					resp.sendRedirect("Pages/userRegister.jsp");
				}
			}
			else {
				session.setAttribute("OverRide", "User Email Id Already Registered");
				resp.sendRedirect("Pages/userRegister.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
