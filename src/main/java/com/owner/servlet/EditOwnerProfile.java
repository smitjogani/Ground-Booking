package com.owner.servlet;

import java.io.IOException;

import com.DAO.OwnerDAOImpl;
import com.DB.DBConnect;
import com.entity.Owner;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateProfileDetails")
public class EditOwnerProfile extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int ownerId = Integer.parseInt(req.getParameter("ownerId"));
		String ownerName = req.getParameter("ownerName");
		String ownerEmail = req.getParameter("ownerEmail");
		String ownerPhone = req.getParameter("ownerPhone");
		String ownercity = req.getParameter("ownerCity");
		String ownerState = req.getParameter("ownerState");

		//System.out.print(ownerId + " " + ownerName + " " + ownerEmail + " " + ownerPhone + " " + ownercity + " " + ownerState);
		
		Owner o = new Owner();
		o.setId(ownerId);
		o.setName(ownerName);
		o.setEmail(ownerEmail);
		o.setPhoneno(ownerPhone);
		o.setCity(ownercity);
		o.setState(ownerState);
		
		OwnerDAOImpl dao = new OwnerDAOImpl(DBConnect.getConn());
		boolean f = dao.editProfile(o);
		
		HttpSession session = req.getSession();
		
		if (f) {
			session.setAttribute("succEditProfileMsg", "Profile Details Updated");
			resp.sendRedirect("Pages/login.jsp");
		} else {
			session.setAttribute("failEditProfileMsg", "Something Wrong");
			resp.sendRedirect("OwnerDash/main.jsp");
		}
	}
}
