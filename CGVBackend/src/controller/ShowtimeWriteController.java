package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.ShowTimeDTO;

public class ShowtimeWriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/show-times/ShowTimesWrite.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int sucOrfail;
		
		String title = req.getParameter("title");
		String time = req.getParameter("time");
		String no = req.getParameter("no");
		String region = req.getParameter("region");
		String name  = req.getParameter("name");
		
		ShowTimeDTO dto = new ShowTimeDTO(
				null,
				null,
				null,
				null,
				time,
				title,
				null,
				null,
				null,
				null,
				no,
				null,
				region,
				name
				);
		
		BackendDAO dao=new BackendDAO(req.getServletContext());
		sucOrfail=dao.insertShowTime(dto);
		
		req.setAttribute("suc_fail", sucOrfail);
		req.setAttribute("where", "INS");
		
		req.getRequestDispatcher("/template/Message.jsp").forward(req, resp);
	}
	
}
