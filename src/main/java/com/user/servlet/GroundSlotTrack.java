package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DAO.SloatgDAOImpl;
import com.DB.DBConnect;
import com.entity.Sloatg;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/bookGroundSlot")
public class GroundSlotTrack extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String bookingDate = req.getParameter("date");
			int groundId = Integer.parseInt(req.getParameter("groundId"));
			int userId = Integer.parseInt(req.getParameter("userId"));
			String slotTime = req.getParameter("sloatg");
			int ownerId = Integer.parseInt(req.getParameter("ownerId"));

			// System.out.println(bookingDate + " " + ownerId + " " + groundId + " " +
			// userId + " " + slotTime);

			Sloatg sg = new Sloatg();
			sg.setSloatGroundId(groundId);
			sg.setSlotOwnerId(ownerId);
			sg.setUserId(userId);
			sg.setDate(bookingDate);
			sg.setSloatTime(slotTime);

			String past = "select * from sloatgroundmapping where bookingDate=? and sloatTime=?";
			Connection conn = DBConnect.getConn();
			PreparedStatement ps = conn.prepareStatement(past);
			ps.setString(1, bookingDate);
			ps.setString(2, slotTime);

			HttpSession session = req.getSession();
			ResultSet rs = ps.executeQuery();
			boolean slotBooked = false;
			while (rs.next()) {
				
				slotBooked = true;
			}
			if (!slotBooked) {
				session = req.getSession();

				SloatgDAOImpl dao = new SloatgDAOImpl(DBConnect.getConn());
				boolean f = dao.bookGroundSlot(sg);

				if (f) {
					session.setAttribute("sucBookMsg", "Slot Booked Successfully");
					resp.sendRedirect("Pages/ground.jsp");
				} else {
					session.setAttribute("failedMsg", "Somethig Wrong");
					resp.sendRedirect("index.jsp");
				}
			}
			else {
				session = req.getSession();
				session.setAttribute("notAvalableMsg", "Slot is Booked");
				resp.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}