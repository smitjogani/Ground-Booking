package com.owner.servlet;

import java.io.IOException;

import com.DAO.SloatbDAOImpl;
import com.DB.DBConnect;
import com.entity.Sloatb;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addSloatb")
public class addBoxSloat extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int boxId = Integer.parseInt(req.getParameter("boxId"));
			int boxOwnerId = Integer.parseInt(req.getParameter("boxOwnerId"));
			String dateb = req.getParameter("Dateb");
			String startTimeb = req.getParameter("startTimeb");
			String endTimeb = req.getParameter("endTimeb");

			// System.out.print(boxOwnerId + " "+ boxId +" " + dateb + " " + startTimeb + "
			// " + endTimeb);

			Sloatb sb = new Sloatb();
			sb.setSloatBoxId(boxId);
			sb.setSlotOwnerId(boxOwnerId);
			sb.setDate(dateb);
			sb.setTimeFrom(startTimeb);
			sb.setTimeTo(endTimeb);

			HttpSession session = req.getSession();
			
			SloatbDAOImpl dao = new SloatbDAOImpl(DBConnect.getConn());
			boolean f = dao.addSloatB(sb);
			
			if(f)
			{
				session.setAttribute("succAddBoxSlotMsg", "Sloat Added successfully");
				resp.sendRedirect("OwnerDash/oBoxes.jsp");
			}
			else
			{
				session.setAttribute("failAddBoxSlotMsg", "Something Wrong");
				resp.sendRedirect("OwnerDash/main.jsp");
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
