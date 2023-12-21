package com.owner.servlet;

import java.io.IOException;

import com.DAO.GroundDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteGround")
public class DeleteGrounds extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			GroundDAOImpl dao = new GroundDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteGround(id);
			
			HttpSession session = req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Ground Deleted Successfully");
				resp.sendRedirect("OwnerDash/oGround.jsp");
				//System.out.print("Done");
			}
			else
			{
				session.setAttribute("failedMsg", "Something Wrong");
				resp.sendRedirect("OwnerDash/main.jsp");
				//System.out.print("Fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
