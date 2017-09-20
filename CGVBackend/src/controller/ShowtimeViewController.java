package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.ShowTimeDTO;



public class ShowtimeViewController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BackendDAO dao = new BackendDAO(req.getServletContext());
		String code =req.getParameter("code");
		
		ShowTimeDTO dto=dao.selectShowTimeOne(code);
		//////여기까지
		req.setAttribute("dto", dto);
		dao.close();
		req.getRequestDispatcher("/show-times/ShowTimesView.jsp").forward(req, resp);
		
	}

}
