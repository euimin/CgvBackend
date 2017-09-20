package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BackendDAO;
import model.SupportPostDto;

public class FaqViewController extends HttpServlet {
		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BackendDAO dao=new BackendDAO(req.getServletContext());
		String no=req.getParameter("no");
		
		SupportPostDto dto=dao.selectFaqOne(no);
		dto.setContent(dto.getContent().replace("\r\n", "<br/>"));
		req.setAttribute("dto", dto);
		dao.close();
		req.getRequestDispatcher("/faq/FaqView.jsp").forward(req, resp);
		
	}

}
