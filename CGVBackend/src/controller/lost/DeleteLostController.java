package controller.lost;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;

public class DeleteLostController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int count = 0;
		String no1 = req.getParameter("no");
		String no = req.getParameter("checkedNo");
		
		if (no1 != null) {
			BackendDAO dao = new BackendDAO(req.getServletContext());
			count = dao.deleteLost(no1);
			dao.close();
			req.setAttribute("SUC_FAIL", count);
			req.setAttribute("WHERE", "DEL");
			
			req.getRequestDispatcher("/lost/Message.jsp").forward(req, resp);
			
		} else {
			
			ArrayList checkedNo = new ArrayList();
			for (int i = 0; i < req.getParameterMap().size(); i++) {
				if (req.getParameter("checkedNo" + i) != null)
					checkedNo.add(req.getParameter("checkedNo" + i));
			}
			
			BackendDAO dao = new BackendDAO(req.getServletContext());
			count = dao.deleteCheckedLost(checkedNo);
			dao.close();
			
			req.setAttribute("SUC_FAIL", count);
			req.setAttribute("WHERE", "DEL");
			
			req.getRequestDispatcher("/lost/Message.jsp").forward(req, resp);

		}
		
		
	}/////////////doPost
		

}/////////////
