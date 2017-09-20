package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;

public class ShowtimeController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BackendDAO dao = new BackendDAO(req.getServletContext());
		
		List list = dao.selectScreeningList();
		
		req.setAttribute("list", list);
		dao.close();
		req.getRequestDispatcher("/show-times/ShowTimes.jsp").forward(req, resp);
	}
	
}
