package com.owner.servlet;

import java.io.IOException;
import java.io.File;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import com.DAO.GroundDAOImpl;
import com.DB.DBConnect;
import com.entity.Grounds;

@WebServlet("/AddGround")
@MultipartConfig
public class addGround extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int groundOwnerId = Integer.parseInt(req.getParameter("groundOwnerId"));
			String groundName = req.getParameter("groundName");
			String groundAdd = req.getParameter("groundAddress");
			String groundCity = req.getParameter("groundCity");
			String groundState = req.getParameter("groundState");
			int groundCharge = Integer.parseInt(req.getParameter("groundCharge"));
			Part part = req.getPart("groundImage");
			String fileName = part.getSubmittedFileName();
			
			
			Grounds g = new Grounds(groundOwnerId,groundName,groundAdd,groundCity,groundState,groundCharge,fileName);
			
			g.setGroundOwnerId(groundOwnerId);
			g.setGroundName(groundName);
			g.setGroundAdd(groundAdd);
			g.setGroundCity(groundCity);
			g.setGroundState(groundState);
			g.setGroundPrice(groundCharge);
			g.setGroundPicture(fileName);
			
			//System.out.println(g);
			
			GroundDAOImpl dao = new GroundDAOImpl(DBConnect.getConn());
			
			boolean f = dao.addGround(g);
			
			HttpSession session = req.getSession();			
			
			if(f)
			{
				//store image in server
				String path = getServletContext().getRealPath("")+"img";
				File file = new File(path);
				part.write(path+File.separator+fileName);
				
				session.setAttribute("succGroundAddMsg", "Ground Added Successfully");
				resp.sendRedirect("OwnerDash/oGround.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Something Wrong");
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
