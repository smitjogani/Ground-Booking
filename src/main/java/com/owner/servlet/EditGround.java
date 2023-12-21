package com.owner.servlet;

import java.io.IOException;

import com.DAO.GroundDAOImpl;
import com.DB.DBConnect;
import com.entity.Grounds;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateGroundDetails")
public class EditGround extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int groundId = Integer.parseInt(req.getParameter("groundId"));
			String groundName = req.getParameter("groundName");
			String groundAdd = req.getParameter("groundAddress");
			String groundCity = req.getParameter("groundCity");
			String groundState = req.getParameter("groundState");
			int groundCharge = Integer.parseInt(req.getParameter("groundCharge"));
			
			//System.out.print(groundId + " " + groundName+ " " +groundAdd+ " " +groundCity+ " " +groundState+ " " +groundCharge);
			
			Grounds g = new Grounds();
			g.setGroundId(groundId);
			g.setGroundName(groundName);
			g.setGroundAdd(groundAdd);
			g.setGroundCity(groundCity);
			g.setGroundState(groundState);
			g.setGroundPrice(groundCharge);
			
			GroundDAOImpl dao = new GroundDAOImpl(DBConnect.getConn());
			boolean f = dao.editGround(g);
			
			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("editGroundSuccMsg", "Ground Details Updated");
				resp.sendRedirect("OwnerDash/oGround.jsp");
			} else {
				session.setAttribute("failedMsg", "Something Wrong");
				resp.sendRedirect("OwnerDash/editGroundDetails.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
