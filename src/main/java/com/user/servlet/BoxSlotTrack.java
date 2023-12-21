package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DAO.SloatbDAOImpl;
import com.DB.DBConnect;
import com.entity.Sloatb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/bookBoxSlot")
public class BoxSlotTrack extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookingDate = req.getParameter("date");
			int boxId = Integer.parseInt(req.getParameter("boxID"));
			int userId = Integer.parseInt(req.getParameter("userId"));
			String slotTime = req.getParameter("sloatb");
			int ownerId = Integer.parseInt(req.getParameter("ownerId"));

			// System.out.println(bookingDate + " " + ownerId + " " + " " + boxId + " " +
			// userId + " " + slotTime);

			Sloatb sb = new Sloatb();
			sb.setSloatBoxId(boxId);
			sb.setSlotOwnerId(ownerId);
			sb.setUserId(userId);
			sb.setDate(bookingDate);
			sb.setSloatTIme(slotTime);

			String past = "select * from sloatboxmapping where bookingDate=? and sloatTime=?";
			Connection conn = DBConnect.getConn();
			PreparedStatement ps = conn.prepareStatement(past);

			ps.setString(1, bookingDate);
			ps.setString(2, slotTime);

			ResultSet rs = ps.executeQuery();
			boolean slotBooked = false;

			while (rs.next()) {
				slotBooked = true;
			}

			if (!slotBooked) {
				HttpSession session = (HttpSession) req.getSession();

				SloatbDAOImpl dao = new SloatbDAOImpl(DBConnect.getConn());
				boolean f = dao.bookBoxSlot(sb);
				if (f) {
					session.setAttribute("sucBookMsg", "Slot Booked Successfully");
					resp.sendRedirect("Pages/boxes.jsp");
				} else {
					session.setAttribute("failedMsg", "Somethig Wrong");
					resp.sendRedirect("index.jsp");
				}
			} else {
				HttpSession session = req.getSession();
				session.setAttribute("notAvalableMsg", "Slot is Booked");
				resp.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
