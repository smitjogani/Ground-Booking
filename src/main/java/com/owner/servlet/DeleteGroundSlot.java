package com.owner.servlet;

import java.io.IOException;

import com.DAO.SloatgDAOImpl;
import com.DB.DBConnect;
import com.entity.Sloatg;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteGroundSlot")
public class DeleteGroundSlot extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			SloatgDAOImpl dao = new SloatgDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteSlot(id);	
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Slot Deleted Successfully");
				resp.sendRedirect("OwnerDash/main.jsp");
				// System.out.print("Done");
			} else {
				session.setAttribute("failedMsg", "Something Wrong");
				// System.out.print("Fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
