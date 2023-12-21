package com.umpire.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DAO.UmpireDAOImpl;
import com.DB.DBConnect;
import com.entity.Umpire;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet("/umpireRegister")
@MultipartConfig
public class UmpireRegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String name = req.getParameter("umpireName");
			String email = req.getParameter("umpireEmail");
			String password = req.getParameter("umpirePassword");
			String phoneno = req.getParameter("umpirePhone");
			String city = req.getParameter("umpireCity");
			String state = req.getParameter("umpireState");
			String charge = req.getParameter("umpireCharge");
			String gender = req.getParameter("umpireGender");

			Part part = req.getPart("umpireImage");
			String image = part.getSubmittedFileName();

			//System.out.println(name + " " + email + " " + password + " " + phoneno + " " + city + " " + state + " "+ charge + " " + gender + " " + image);
			Umpire um = new Umpire();
			um.setName(name);
			um.setEmail(email);
			um.setPassword(password);
			um.setPhoneno(phoneno);
			um.setCity(city);
			um.setState(state);
			um.setCharge(charge);
			um.setGender(gender);
			um.setPicture(image);

			String past = "select * from umpire where umpireEmail=?";
			Connection conn = DBConnect.getConn();
			PreparedStatement ps = conn.prepareStatement(past);
			ps.setString(1, email);

			HttpSession session = (HttpSession) req.getSession();
			ResultSet rs = ps.executeQuery();
			boolean umpireRegistered = false;

			while (rs.next()) {
				umpireRegistered = true;
			}

			if (!umpireRegistered) {
				UmpireDAOImpl dao = new UmpireDAOImpl(DBConnect.getConn());
				boolean f = dao.umpireRegister(um);

				if (f) {

					String path = getServletContext().getRealPath("") + "img";
					// System.out.println(path);

					File file = new File(path);
					part.write(path + File.separator + image);

					// System.out.println("Umpire Register Successfully");
					session.setAttribute("succRegMsg", "Umpire Registration Successfully");
					resp.sendRedirect("Pages/login.jsp");
				} else {
					System.out.println("Somthig wrong");
					session.setAttribute("failedRegMsg", "Umpire Registration Fail");
					resp.sendRedirect("Pages/umpireRegister.jsp");
				}
			} else {
				session.setAttribute("OverRide", "Umpire Email Id Already Registered");
				resp.sendRedirect("Pages/userRegister.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
