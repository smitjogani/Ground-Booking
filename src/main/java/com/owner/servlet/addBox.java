package com.owner.servlet;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

import com.DAO.BoxDAOImpl;
import com.DB.DBConnect;
import com.entity.Boxes;

@WebServlet("/addBox")
@MultipartConfig
public class addBox extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int boxOwnerId = Integer.parseInt(req.getParameter("boxOwnerId"));
			String boxName = req.getParameter("boxName");
			String boxAdd = req.getParameter("boxAddress");
			String boxCity = req.getParameter("boxCity");
			String boxState = req.getParameter("boxState");
			int boxCharge = Integer.parseInt(req.getParameter("boxCharge"));
			Part part = req.getPart("boxImage");
			String fileName = part.getSubmittedFileName();

			Boxes b = new Boxes(boxOwnerId, boxName, boxAdd, boxCity, boxState, boxCharge, fileName);

			b.setBoxOwnerId(boxOwnerId);
			b.setBoxName(boxName);
			b.setBoxAdd(boxAdd);
			b.setBoxCity(boxCity);
			b.setBoxState(boxState);
			b.setBoxPrice(boxCharge);
			b.setBoxPicture(fileName);

			//System.out.println(b);

			BoxDAOImpl dao = new BoxDAOImpl(DBConnect.getConn());
			boolean f = dao.addBox(b);

			HttpSession session = req.getSession();

			if (f) {
				// store image in server
				String path = getServletContext().getRealPath("") + "img";
				File file = new File(path);
				part.write(path + File.separator + fileName);

				session.setAttribute("addBoxSuccMsg", "Box Added Successfully");
				resp.sendRedirect("OwnerDash/oBoxes.jsp");
			} else {
				session.setAttribute("addBoxFailedMsg", "Something Wrong");
				resp.sendRedirect("OwnerDash/main.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
