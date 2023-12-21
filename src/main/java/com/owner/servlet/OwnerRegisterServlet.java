package com.owner.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DAO.OwnerDAOImpl;
import com.DB.DBConnect;
import com.entity.Owner;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet("/ownerRegister")
@MultipartConfig
public class OwnerRegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("ownerName");
			String email = req.getParameter("ownerEmail");
			String password = req.getParameter("ownerPassword");
			String phoneno = req.getParameter("ownerPhone");
			String city = req.getParameter("ownerCity");
			String state = req.getParameter("ownerState");
			String gender = req.getParameter("ownerGender");

			Part part = req.getPart("ownerImage");
			String image = part.getSubmittedFileName();

			//System.out.println(name + " " + email + " " + password + " " + phoneno +" " + city + " "+ state +" " + gender + " " + image);
			Owner ow = new Owner();
			ow.setName(name);
			ow.setEmail(email);
			ow.setPassword(password);
			ow.setPhoneno(phoneno);
			ow.setCity(city);
			ow.setState(state);
			ow.setGender(gender);
			ow.setPicture(image);
			
			String past = "select * from owner where ownerEmail=?";
			Connection conn = DBConnect.getConn();
			PreparedStatement ps = conn.prepareStatement(past);
			ps.setString(1, email);
			
			HttpSession session = (HttpSession) req.getSession();
			ResultSet rs = ps.executeQuery();
			boolean ownerRegistered = false;
			
			while (rs.next()) {
				ownerRegistered = true;
			}

			if(!ownerRegistered)
			{
				OwnerDAOImpl dao = new OwnerDAOImpl(DBConnect.getConn());

				boolean f = dao.ownerRegister(ow);

				if (f) {

					String path = getServletContext().getRealPath("") + "img";
					System.out.println(path);

					File file = new File(path);
					part.write(path + File.separator + image);

					//System.out.println("Owner Register Successfully");
					session.setAttribute("succRegMsg", "Owner Registration Successfully");
					resp.sendRedirect("Pages/login.jsp");
				} else {
					//System.out.println("Somthig wrong");
					session.setAttribute("failedRegMsg", "Owner Registration Fail");
					resp.sendRedirect("Pages/ownerRegister.jsp");
				}
			}
			else {
				session.setAttribute("OverRide", "Owner Email Id Already Registered");
				resp.sendRedirect("Pages/userRegister.jsp");
			}
			
	
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
