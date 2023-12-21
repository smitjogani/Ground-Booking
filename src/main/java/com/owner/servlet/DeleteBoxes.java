package com.owner.servlet;

import java.io.IOException;

import com.DAO.BoxDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteBox")
public class DeleteBoxes extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			BoxDAOImpl dao = new BoxDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteBox(id);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succMsg", "Box Deleted Successfully");
				resp.sendRedirect("OwnerDash/oBoxes.jsp");
				// System.out.print("Done");
			} else {
				session.setAttribute("failedMsg", "Something Wrong");
				resp.sendRedirect("OwnerDash/oGround.jsp");
				// System.out.print("Fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
