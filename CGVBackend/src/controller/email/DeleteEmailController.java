package controller.email;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;

public class DeleteEmailController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		doPost(req, resp);
		
	}////////////////doGet

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		int count = 0;
		String no1 = req.getParameter("no");
		String no = req.getParameter("checkedNo");
		
		if (no1 != null) {
			BackendDAO dao = new BackendDAO(req.getServletContext());
			count = dao.deleteEmail(no1);
			dao.close();
			req.setAttribute("SUC_FAIL", count);
			req.setAttribute("WHERE", "DEL");
			
			req.getRequestDispatcher("/email/Message.jsp").forward(req, resp);
			
		} else {
			
			ArrayList checkedNo = new ArrayList();
			for (int i = 0; i < req.getParameterMap().size(); i++) {
				if (req.getParameter("checkedNo" + i) != null)
					checkedNo.add(req.getParameter("checkedNo" + i));
			}
			
			BackendDAO dao = new BackendDAO(req.getServletContext());
			count = dao.deleteCheckedEmail(checkedNo);
			dao.close();
			req.setAttribute("SUC_FAIL", count);
			req.setAttribute("WHERE", "DEL");
			
			req.getRequestDispatcher("/email/Message.jsp").forward(req, resp);

		}
		
		
	}/////////////doPost
	
}/////////////////////////
