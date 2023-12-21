package com.owner.servlet;

import java.io.IOException;

import org.apache.coyote.Response;

import com.DAO.SloatgDAO;
import com.DAO.SloatgDAOImpl;
import com.DB.DBConnect;
import com.entity.Sloatg;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addSloatg")
public class addGroundSloat extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int groundId = Integer.parseInt(req.getParameter("groundId"));
		int groundOwnerId = Integer.parseInt(req.getParameter("groundOwnerId"));
		String dateg = req.getParameter("Dateg");
		String startTimeg = req.getParameter("startTimeg");
		String endTimeg = req.getParameter("endTimeg");

		//System.out.println(groundId + " " +groundOwnerId + " " + dateg + " " + startTimeg + " "+ endTimeg);

		Sloatg sg = new Sloatg();
		sg.setSloatGroundId(groundId);
		sg.setSlotOwnerId(groundOwnerId);
		sg.setDate(dateg);
		sg.setTimeFrom(startTimeg);
		sg.setTimeTo(endTimeg);
		
		HttpSession session = req.getSession();
		
		SloatgDAOImpl dao = new SloatgDAOImpl(DBConnect.getConn());
		boolean f = dao.addSloat(sg);
		
		if(f)
		{
			session.setAttribute("groundSlotSuccMsg", "Sloat Added successfully");
			resp.sendRedirect("OwnerDash/oGround.jsp");
		}
		else
		{
			session.setAttribute("groundSlotFailedMsg", "Something Wrong");
			resp.sendRedirect("OwnerDash/main.jsp");
		}
	}
}
