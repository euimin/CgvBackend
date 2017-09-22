package controller.email;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;

public class EmailViewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
		
	}/////////////

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String no = req.getParameter("no");
		
		BackendDAO dao = new BackendDAO(req.getServletContext());
		
		List list = dao.viewEmailList(no);
		
		req.setAttribute("list",list);
		
		
		req.getRequestDispatcher("/email/email_view.jsp").forward(req, resp);

	}////////////

	
	
	
	
}///////////////////view_controller
