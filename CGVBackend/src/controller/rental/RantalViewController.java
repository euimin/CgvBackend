package controller.rental;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;

public class RantalViewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String no = req.getParameter("no");
		
		BackendDAO dao = new BackendDAO(req.getServletContext());
		List list = dao.viewRantalList(no);
		
		req.setAttribute("list",list);
		
		req.getRequestDispatcher("/rental/Rental_view.jsp").forward(req, resp);
		
		
		
	}////////////////dopost

	
	
	
	
	
}//////////////////viewController
