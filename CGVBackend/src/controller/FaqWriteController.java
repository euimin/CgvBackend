package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.SupportPostDto;

public class FaqWriteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/faq/FaqWrite.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int sucOrfail;
		
		String category=req.getParameter("category");
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		
		SupportPostDto dto = new SupportPostDto(
				null,
				category,
				title,
				null,
				null,
				content
				);
		
		BackendDAO dao=new BackendDAO(req.getServletContext());
		sucOrfail=dao.insert(dto);
		
		req.setAttribute("suc_fail", sucOrfail);
		req.setAttribute("where", "INS");
		dao.close();
		req.getRequestDispatcher("/faq/Message.jsp").forward(req, resp);
	}

}
