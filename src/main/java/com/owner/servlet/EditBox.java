package com.owner.servlet;

import java.io.IOException;

import com.DAO.BoxDAOImpl;
import com.DB.DBConnect;
import com.entity.Boxes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateBoxDetails")
public class EditBox extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int boxId = Integer.parseInt(req.getParameter("boxID"));
			String boxName = req.getParameter("boxName");
			String boxAdd = req.getParameter("boxAdd");
			String boxCity = req.getParameter("boxCity");
			String boxState = req.getParameter("boxState");
			int boxCharge = Integer.parseInt(req.getParameter("boxCharge"));

			// System.out.print(boxOwnerId + " " + boxName + " " + boxAdd + " " + boxCity +
			// " " + boxState + " " + boxCharge);

			Boxes b = new Boxes();
			b.setBoxId(boxId);
			b.setBoxName(boxName);
			b.setBoxAdd(boxAdd);
			b.setBoxCity(boxCity);
			b.setBoxState(boxState);
			b.setBoxPrice(boxCharge);

			BoxDAOImpl dao = new BoxDAOImpl(DBConnect.getConn());

			boolean f = dao.editBox(b);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("succEditBoxMsg", "Box Details Updated");
				resp.sendRedirect("OwnerDash/oBoxes.jsp");
			} else {
				session.setAttribute("editBoxFailedMsg", "Something Wrong");
				resp.sendRedirect("OwnerDash/editBoxDetails.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
